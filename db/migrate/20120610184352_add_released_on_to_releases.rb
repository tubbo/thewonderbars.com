class AddReleasedOnToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :released_on, :date
  end
end
