class ScoutsController < AuthenticatedController
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
    @scout = Scout.create scout_params
    redirect_to scouts_url
  end

  def edit
    @scout = Scout.find_by id: params[:id]
  end

  def update
    @scout = Scout.find_by id: params[:id]
    @scout.update_attributes scout_params
    
    respond_to do |format|
      format.html do
        if @scout.valid?
          redirect_to scouts_url
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
end