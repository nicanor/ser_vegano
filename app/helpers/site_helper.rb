module SiteHelper
  
  def facebook_url
    'http://www.facebook.com/servegano.com.ar'
  end

  def google_plus_url
    'http://www.facebook.com/servegano.com.ar'
  end

  def page_path(page)
    case page.page_type
    when 'static'   then static_page_path(page)
    when 'article'  then article_path(page)
    when 'recipe'   then recipe_path(page)
    when 'resource' then resource_path(page)
    end
  end

  def current_page
    @page || @article || @recipe || @resource
  end

  def description_tag
    if current_page
      current_page.description
    elsif @description.present?
      @description
    else
      site.description
    end
  end

  def title_tag
    if current_page
      "#{t :brand} :: #{current_page.title}"
    elsif @title.present?
      "#{t :brand} :: #{@title}"
    else
      t(:brand)
    end
  end

end