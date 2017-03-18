class ScoutsController < AuthenticatedController
  before_action :set_scout, except: [:index, :new, :create]

  def index
    enforce_view_permission(Scout)
    @scouts = Scout.order('lower(first_name), lower(last_name)')

    if params[:active] == 'true'
      @scouts = @scouts.active
    elsif params[:active] == 'false'
      @scouts = @scouts.inactive
    end

    if params[:admin] == 'true'
      @scouts = @scouts.admin
    elsif params[:admin] == 'false'
      @scouts = @scouts.noadmin
    end
  end

  def new
    @scout = Scout.new
  end

  def create
    @scout = Scout.new scout_params
    if @scout.save
      redirect_to scouts_url, flash: { success: 'Account created!' }
    else
      render 'new'
    end
  end

  def update
    @scout.update_attributes scout_params

    respond_to do |format|
      format.html do
        if @scout.valid?
          redirect_to scouts_url, flash: { success: 'Account created!' }
        else
          render 'edit'
        end
      end
      format.js
    end
  end

  private

  def scout_params
    params.require(:scout).permit(:first_name, :last_name, :nickname, :email, :password, :is_active, :slot, :is_admin)
  end

  def set_scout
    @scout = Scout.find_by id: params[:id]
    redirect_to scouts_path, flash: { danger: "Scout not found." } if @scout.nil?
  end
end
