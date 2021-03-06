class ApplicationController < ActionController::Base
  before_filter :www_redirect

  private
  def www_redirect
    unless /^www/.match(request.host)
      redirect_to("#{request.url}".gsub("#{request.protocol}", "#{request.protocol}www."), status: 301)
    end
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
