class ScanWorker
  include Sidekiq::Worker
  require 'csv'    

  def perform(spec_scan_id, baseline_id, driver, lower, upper, bin_size)
    

  	# Start scanning with rx_power

    if spec_scan_id.present?
  	  SpecScan.find(spec_scan_id).update_attribute(:status, "pending")
    elsif baseline_id.present?
  	  Baseline.find(baseline_id).update_attribute(:status, "pending")
    end
    

    filename = "#{Rails.root}/#{baseline_id}#{spec_scan_id}survey_single_shot.csv"
  	cmd = "rx_power -d driver=#{driver} -f #{lower}:#{upper}:#{bin_size} -1 #{filename}"
  	puts filename
  	puts cmd
  	x=system(cmd)
  	# Parse file and add records to database
  	puts x
  	puts "CMD ^^^^^"
  	csv_text = File.read(filename)
	csv = CSV.parse(csv_text, :headers => true)
	csv.each do |row|
	  puts row


	  item = ScanItem.new
	  item.time = row[1]
	  item.lower = row[2]
	  item.upper = row[3]
  	  item.power = row[7].to_f

  	  if spec_scan_id.present?
  	  	item.spec_scan_id = spec_scan_id
  	  elsif baseline_id.present?
  	  	item.baseline_id = baseline_id
  	  end

  	  item.save


	end

  	# Destroy file, it's no longer required


  	`rm #{filename}`

    if spec_scan_id.present?
  	  SpecScan.find(spec_scan_id).update_attribute(:status, "complete")
    elsif baseline_id.present?
  	  Baseline.find(baseline_id).update_attribute(:status, "complete")
    end

  end
end