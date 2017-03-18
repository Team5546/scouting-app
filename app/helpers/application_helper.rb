module ApplicationHelper
  COLORS = {
    "r" => 'navbar-inverse red',
    "b" => 'navbar-inverse blue',
    nil => 'navbar-light bg-faded'
  }

  def navbar_color
    COLORS[current_scout.slot.try(:match, /r|b/).try(:to_s)]
  end
end