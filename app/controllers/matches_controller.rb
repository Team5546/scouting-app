class MatchesController < AuthenticatedController
  before_action :set_match, except: [:index, :new, :create]

  def index
    enforce_view_permission Match
    @matches = Match.all
  end
  
  def new
    @match = Match.new
    ['red', 'blue'].each do |color|
      alliance = @match.alliances.build color: color
      3.times { |i| alliance.members.build }
    end
  end
  
  def create
    @match = Match.new match_params
    if @match.save
      redirect_to matches_path
    else
      render :new
    end
  end
  
  def update
    if @match.update_attributes match_params
      redirect_to matches_path, flash: { success: 'Successfully updated match!' }
    else
      render 'edit'
    end
  end
  
  private
  
  def match_params
    params.require(:match).permit(:number, alliances_attributes: [:id, :color, members_attributes: [:id, :team_id]])
  end
  
  def set_match
    @match = Match.find_by id: params[:id]
  end
end