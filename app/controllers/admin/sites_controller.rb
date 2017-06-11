class Admin::SitesController < Admin::AdminController

  before_action :set_site, only: [:show, :update, :destroy]

  def show
  end

  def create
    site = Site.new(site_params)
    if site.save
      redirect_to [:admin,  site], success: t(:created)
    else
      redirect_to [:admin, :root], success: t(:failed)
    end
  end

  def update
    if @site.update(site_params)
      redirect_to [:admin, @site], success: t(:updated)
    else
      render :show
    end
  end

  def destroy
    if @site.destroy
      redirect_to [:admin, :pages], success: t(:deleted)
    else
      redirect_to [:admin, @site], danger: t(:failed)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:name, :code, :description)
    end
end
