class Site < ActiveRecord::Base

  has_many :pages

  validates :code, :name, :description, presence: true
  validates :code, uniqueness: true

  def static_pages
    pages.where(page_type: :static)
  end

  def articles
    pages.where(page_type: :article)
  end

  def recipes
    pages.where(page_type: :recipe)
  end

  def resources
    pages.where(page_type: :resource)
  end
end
