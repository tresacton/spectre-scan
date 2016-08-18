class AddProjectIdToSpecScans < ActiveRecord::Migration
  def change
    add_column :spec_scans, :project_id, :integer
  end
end
