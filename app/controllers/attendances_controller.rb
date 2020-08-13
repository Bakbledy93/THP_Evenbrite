class AttendancesController < ApplicationController
  before_action :authenticate_current_user, only:[:edit,:delete]

  def authenticate_current_user
    @event = Event.find(params[:id])
    if current_user.id == @event.admin.id
      puts 'yey'
    else
      redirect_to events_path
      puts 'oh no'
    end
  end
  
  def new
  end

  def index
    @attendances = Attendance.where(event: params[:event])
  end
  
  def edit
    @id = params[:id]
  end



end
