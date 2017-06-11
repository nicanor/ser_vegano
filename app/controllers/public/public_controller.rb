class Public::PublicController < ApplicationController

  before_action :load_all

  def home
    @title = site.description
  end

  def sitemap
    respond_to do |format|
      format.xml
    end
  end

  private

  def load_all
    @static_pages  = site.static_pages.is_public.order(:id)
    @last_articles = site.articles.is_public.first(4)
    @last_recipes  = site.recipes.is_public.first(4)
  end
end