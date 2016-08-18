class CreateBaselines < ActiveRecord::Migration
  def change
    create_table :baselines do |t|
      t.string :status
      t.string :job_id

      t.timestamps
    end
  end
end
