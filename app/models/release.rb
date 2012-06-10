class Release < ActiveRecord::Base
  attr_accessible :catalog_number, :record_label, :name, :notes, :tracks, :released_on
  validates_presence_of :name, :record_label, :catalog_number, :released_on

  def has_track_information?
    self.tracks.present?
  end

  def has_notes?
    self.notes.present?
  end
end
