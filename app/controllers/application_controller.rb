class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    locale = params[:locale] || cookies[:locale] || I18n.default_locale
    if locale && I18n.available_locales.include?(locale.to_sym)
      cookies[:locale] = { value: locale, expires: 1.year.from_now }
      I18n.locale = locale
    end
  end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
