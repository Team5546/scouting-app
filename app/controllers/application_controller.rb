class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_scout

  private

  def current_scout
    @current_scout ||= Scout.find_by id: session[:id]
  end
end
