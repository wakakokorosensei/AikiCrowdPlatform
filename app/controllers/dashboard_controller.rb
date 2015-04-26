class DashboardController < ApplicationController
  before_filter :authenticate_user!
  #layout :board_section


  def profile
  end

  def settings
    current_user
  end

  def myprojects
  end

  def comments
  end

  def dashboard_page

  end



  private

  def board_section
    page = request.path_parameters[:action]
  end

end
