class Release < ActiveRecord::Base
  #attr_accessible :catalog_number, :record_label, :name, :notes, :tracks, :released_on
  validates :name, presence: true
  validates :catalog_number, presence: true
  validates :record_label, presence: true
  validates :released_on, presence: true

  def has_track_information?
    self.tracks.present?
  end

  def has_notes?
    self.notes.present?
  end
end
