class CreateSpecScans < ActiveRecord::Migration
  def change
    create_table :spec_scans do |t|
      t.string :status
      t.string :job_id

      t.timestamps
    end
  end
end
