class SessionsController < ApplicationController
  def new
  end

  def create
    @scout = Scout.find_by email: request.env["omniauth.auth"][:info][:email]
    if @scout.nil?
      redirect_to root_url
    else
      session[:id] = @scout.id
      redirect_to scouts_url
    end
  end

  def destroy
    session.delete(:id)
    redirect_to root_url
  end
end
