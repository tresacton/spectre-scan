class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :min_freq
      t.string :max_freq
      t.string :device
      t.string :bin_size
      t.text :notes

      t.timestamps
    end
  end
end
