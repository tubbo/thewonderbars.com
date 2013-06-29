class AddArtworkToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :artwork, :string
  end
end
