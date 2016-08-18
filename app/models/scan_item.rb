class ScanItem < ActiveRecord::Base
	belongs_to :spec_scan
	belongs_to :baseline
end
