class Admin::AdminController < ApplicationController

  before_filter :require_login

  def root
    @page_count     = site.static_pages.count
    @article_count  = site.articles.count
    @recipe_count   = site.recipes.count
    @resource_count = site.resources.count
    @image_count    = Image.count

    @site  = Site.new
    @sites = Site.all
  end


end