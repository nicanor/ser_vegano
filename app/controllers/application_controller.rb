class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  before_action :set_locale

  private

  def require_login
    flash[:warning] = t(:login_required) if !logged_in?
    super
  end

  def set_locale
    I18n.locale = current_locale
  end

  def current_locale
    num = (Rails.env == 'development') ? 0 : 1
    parsed_locale = request.subdomain(num).to_sym
    locale = I18n.available_locales.include?(parsed_locale) ? parsed_locale : I18n.default_locale
  end

  def site
    @_site ||= Site.find_by(code: current_locale)
  end
  helper_method :site

end