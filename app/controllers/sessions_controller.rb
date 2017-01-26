class SessionsController < ApplicationController
  def new
  end

  def create
    info = {
      email: request.env["omniauth.auth"][:info][:email],
      first_name: request.env["omniauth.auth"][:info][:first_name],
      last_name: request.env["omniauth.auth"][:info][:last_name]
    }
    @scout = Scout.find_by email: info[:email]
    if @scout.nil?
      if info[:email] =~ /@args\.us$/
        @scout = Scout.create info
        session[:id] = @scout.id
        redirect_to root_url
      else
        redirect_to login_url
      end
    else
      session[:id] = @scout.id
      redirect_to root_url
    end
  end

  def destroy
    session.delete(:id)
    redirect_to root_url
  end
end
