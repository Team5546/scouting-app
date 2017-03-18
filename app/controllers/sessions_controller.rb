class SessionsController < ApplicationController
  def new
    @scout = Scout.new
  end

  def create
    reset_session

    @scout = Scout.find_by_email(params[:email])
    if @scout && @scout.authenticate(params[:password])
      session[:id] = @scout.id
      redirect_to root_url, flash: { success: "You've successfully signed in!" }
    else
      flash[:danger] = "Invalid email or password"
      render "new"
    end
  end

  def create_from_oauth
    reset_session

    info = {
      email: request.env["omniauth.auth"][:info][:email],
      first_name: request.env["omniauth.auth"][:info][:first_name],
      last_name: request.env["omniauth.auth"][:info][:last_name]
    }
    @scout = Scout.find_by email: info[:email]
    if @scout.nil?
      if info[:email] =~ /@args\.us$/
        @scout = Scout.create! info
        session[:id] = @scout.id
        redirect_to root_url, flash: { success: "You've successfully signed up!" }
      else
        redirect_to login_url, flash: { danger: 'No user found. Try an @args.us address.' }
      end
    else
      session[:id] = @scout.id
      redirect_to root_url, flash: { success: "You've successfully signed in!" }
    end
  end

  def destroy
    Scout.find_by(id: session[:id]).try(:update_attributes, slot: nil)
    session.delete(:id)
    redirect_to root_url
  end
end
