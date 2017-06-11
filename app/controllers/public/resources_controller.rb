class Public::ResourcesController < Public::PublicController

  def index
    @resources = site.resources.is_public
    @title     = t(:resources)
  end

  def show
    @resource = site.resources.friendly.find(params[:id])
  end

  def download
    resource = site.resources.friendly.find(params[:id])
    send_data resource.photo.file.read, type: resource.photo.mime_type, disposition: 'inline'
  end

end