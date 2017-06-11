class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :site

  TYPES = ['static', 'article', 'recipe', 'resource']

  validates :title, presence: true
  validates :slug, uniqueness: true
  validates :page_type, inclusion: {in: TYPES}

  def destroy
    super unless protected?
  end

  scope :is_public, -> {where(public: true).order('publication_date DESC')}

  dragonfly_accessor 'photo' do
    storage_options do |f|
      { path: File.join('page', id.to_s, "photo-#{rand(10000)}.#{f.format}") }
    end
  end

end