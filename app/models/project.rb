class Project < ActiveRecord::Base
	has_many :spec_scans
	has_one :baseline
	
end
