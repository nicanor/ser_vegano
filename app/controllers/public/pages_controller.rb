class Public::PagesController < Public::PublicController

  def show
    @page = site.static_pages.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    begin
      @page = site.static_pages.find_by!(old_slug: params[:id])
      @canonical = static_page_url(@page)
    rescue ActiveRecord::RecordNotFound
      render '404', status: :not_found
    end
  end

end