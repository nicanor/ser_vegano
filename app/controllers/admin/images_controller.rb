class Admin::ImagesController < Admin::AdminController

  before_action :set_image, only: [:show, :update, :destroy]

  def index
    @image  = Image.new
    @images = Image.all
  end

  def show
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to [:admin,  @image], success: t(:created)
    else
      redirect_to [:admin, :images], success: t(:failed)
    end
  end

  def update
    if @image.update(image_params)
      redirect_to [:admin, @image], success: t(:updated)
    else
      render :show
    end
  end

  def destroy
    if @image.destroy
      redirect_to [:admin, :images], success: t(:deleted)
    else
      redirect_to [:admin, @image], danger: t(:failed)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:title, :slug, :file, :remove_file)
    end
end
