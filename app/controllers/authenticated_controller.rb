class AuthenticatedController < ApplicationController
  before_action :check_user

  def check_user
    if current_scout.nil?
      redirect_to login_url
    end
  end
end