class Release < ActiveRecord::Base
  validates :name, presence: true
  validates :catalog_number, presence: true
  validates :record_label, presence: true
  validates :released_on, presence: true

  mount_uploader :artwork, ReleaseArtworkUploader

  def has_track_information?
    self.tracks.present?
  end

  def has_notes?
    self.notes.present?
  end
end
