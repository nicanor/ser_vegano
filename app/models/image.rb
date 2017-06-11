class Image < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: :slugged

  before_create :set_attributes

  validates :file, presence: true, on: :create

  dragonfly_accessor 'file' do
    storage_options do |f|
      { path: File.join('image', id.to_s, "file-#{rand(10000)}.#{f.format}") }
    end
  end

private

  def set_attributes
    if file.present?
      self.width     = file.width 
      self.height    = file.height
      self.size      = file.size
      self.format    = file.format      
      self.mime_type = file.mime_type
    end
  end

end