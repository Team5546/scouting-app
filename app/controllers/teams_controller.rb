class TeamsController < AuthenticatedController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new team_params
    if @team.save
      redirect_to teams_path
    else
      render :new
    end
  end

  def update
    @team = Team.find_by id: params[:id]
    @team.update_attributes team_params
    redirect_to teams_url
  end

  def edit
    @team = Team.find_by id: params[:id]
  end

private

def team_params
  params[:team].permit(:name, :number, :high_fuel, :low_fuel, :get_gear, :deliver_gear, :climb_rope, :comments, :top_picture, :side_picture, :front_picture)
 end
end
