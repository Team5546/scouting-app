class ScoutsController < ApplicationController
  def index
    if current_scout.nil?
      redirect_to login_url
    end
    @scouts = Scout.all
  end

  def new
    @scout = Scout.new
  end

  def create
    @scout = Scout.create scout_params
    redirect_to scouts_url
  end

  def edit
    @scout = Scout.find_by id: params[:id]
  end

  def update
    @scout = Scout.find_by id: params[:id]
    @scout.update_attributes scout_params
    redirect_to scouts_url
  end

  private

  def scout_params
    params[:scout].permit(:first_name, :last_name, :email)
  end
end
