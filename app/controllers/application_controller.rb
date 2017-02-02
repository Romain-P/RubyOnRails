class ApplicationController < ActionController::Base
  before_filer :add_www_subdomain

  private
  def add_www_subdomain
    unless /^www/.match(request.host)
      redirect_to("#{request.protocol}x.com#{request.request_uri}",
                  :status => 301)
    end
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
