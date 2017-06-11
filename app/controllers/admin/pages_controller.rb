class Admin::PagesController < Admin::AdminController

  before_action :set_page, only: [:show, :update, :destroy]

  def index
    @page  = Page.new
    @pages = site.pages
  end

  def statics  ; pages(:static)  ; end
  def articles ; pages(:article) ; end
  def recipes  ; pages(:recipe)  ; end
  def resources; pages(:resource); end

  def pages(page_type)
    @page  = Page.new(page_type: page_type)
    @pages = site.pages.where(page_type: page_type)
    render 'index'
  end

  def show
  end

  def create
    @page = site.pages.build(page_params)
    if @page.save
      redirect_to [:admin,  @page], success: t(:created)
    else
      redirect_to [:admin, @page.page_type.to_s.pluralize], warning: t(:failed)
    end
  end

  def update
    if @page.update(page_params)
      redirect_to [:admin, @page], success: t(:updated)
    else
      flash[:warning] = t(:failed)
      render :show
    end
  end

  def destroy
    if @page.destroy
      redirect_to [:admin, @_type], success: t(:deleted)
    else
      redirect_to [:admin, @page], danger: t(:failed)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = site.pages.friendly.find(params[:id])
      @_type = @page.page_type.to_s.pluralize
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :page_type, :slug, :old_slug, :publication_date, :description, :facebook_url, :content, :public, :protected, :photo, :remove_photo)
    end
end
