CONTROL_SCALE = {
  #auto_fuel_top: 50,
  #auto_fuel_accuracy: 50,
  auto_fuel_bottom: 50,
  #teleop_fuel_top: 50,
  #teleop_fuel_accuracy: 50,
  teleop_fuel_bottom: 50
}

class ReportsController < AuthenticatedController
  before_action :set_match, except: :index
  before_action :set_report, except: [:index, :new, :create]
  before_action :check_errors, except: :index

  def index
    @upcoming_matches = Match.order(:number).reject { |match| match.reports.find_by(team: current_scout.find_team_for_match(match)) }

    @previous_reports = current_scout.reports
  end

  def new
    @report = Report.new(scout: current_scout, team: current_scout.find_team_for_match(@match))
  end

  def create
    @report = @match.reports.build report_params do |r|
      r.scout = current_scout
      r.team  = current_scout.find_team_for_match(@match)
    end

    if @report.save
      redirect_to matches_path
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render "new"
    end
  end

  def update
    if @report.update_attributes report_params
      redirect_to reports_path, flash: { success: 'Successfully updated report!' }
    else
      render 'edit'
    end
  end

  private

  def report_params
    report_params = params.require(:report).permit(:match_id, :scout, :auto_flipped, :auto_moved, :auto_fuel_speed, :auto_fuel_accuracy, :auto_fuel_bottom, :auto_gears_collected, :auto_gears_delivered, :auto_goal_line, :teleop_fuel_speed, :teleop_fuel_accuracy, :teleop_fuel_bottom, :teleop_gears_off_the_ground, :teleop_gears_collected, :teleop_gears_delivered, :flipped, :broken)
  end

  def set_match
    @match = Match.find_by id: params[:match_id]
    redirect_to reports_path, flash: { error: "No match found." } if @match.nil?
  end

  def set_report
    @report = @match.reports.find_by(id: params[:id])
    redirect_to reports_path, flash: { error: "No report found." } if @match.nil?
  end

  def check_errors
    if current_scout.slot.nil?
      redirect_to noslot_path
    end
  end
end
