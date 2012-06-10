class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :name
      t.string :catalog_number
      t.string :record_label
      t.text :tracks
      t.text :notes
      t.timestamps
    end
  end
end
