class ApplicationController < ActionController::Base
  include Canable::Enforcers
  protect_from_forgery with: :exception
  helper_method :current_scout
  
  rescue_from 'Canable::Transgression' do |exception|
    flash[:danger] = "You're not allowed to view that."
    redirect_to root_url
  end

  private

  def current_scout
    @current_scout ||= Scout.find_by id: session[:id]
  end
  
  def current_user
    current_scout
  end
end