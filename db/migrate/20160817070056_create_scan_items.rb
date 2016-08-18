class CreateScanItems < ActiveRecord::Migration
  def change
    create_table :scan_items do |t|
      t.integer :spec_scan_id
      t.integer :baseline_id
      t.string :upper
      t.string :lower
      t.string :time
      t.float :power

      t.timestamps
    end
  end
end
