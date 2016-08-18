class AddProjectIdToBaselines < ActiveRecord::Migration
  def change
    add_column :baselines, :project_id, :integer
  end
end
