class DataController < AuthenticatedController
  def index
  end
  
  def rawdata
      @teams = Team.all
      @reports = Report.all
  end
  
  FILTER_KEYS = [
    :auto_fuel_speed, :auto_fuel_accuracy, :auto_fuel_bottom, :auto_gears_collected, :auto_gears_delivered,
    :auto_rotors, :auto_goal_line, :auto_flipped, :teleop_fuel_speed, :teleop_fuel_accuracy, :teleop_fuel_bottom,
    :teleop_gears_collected, :teleop_gears_delivered, :teleop_gears_off_the_ground, :flipped, :broken, :climb
  ]
  
  def sorteddata
    @reports = Report.order('match_id')
    FILTER_KEYS.each do |key|
      if params[key] == 'true'
        @reports = @reports.order(key => :desc)
      end
    end
  end
  
  def averagedata
    @reports = Report.all.group_by(&:team).inject([]) do |result, (team, reports)|
      report = { team: team }
      FILTER_KEYS.each do |key|
        begin
          report[key] = reports.map do |report|
            value = report.send(key)
            ((value.is_a?(TrueClass) || value.is_a?(FalseClass)) ? value.to_i : value).to_f || 0.0
          end.inject(&:+) / reports.size
        # rescue
        #   throw [key, reports.map(&key)]
        end
      end
      result << OpenStruct.new(report)
    end
    
    sorted_keys = FILTER_KEYS.select { |key| params[key] == 'true' }
    
    @reports = @reports.sort_by do |r|
      sorted_keys.map { |key| r[key] }
    end.reverse
  end

  def rankeddata
    @teams = Team.all
  end
  
  def rankmultiplier
    @weights = Weight.all
  end
      
  def data_params
    params.require(:match).permit(:is_auto, :team_number, :match_number, :gears_collected)
  end
end