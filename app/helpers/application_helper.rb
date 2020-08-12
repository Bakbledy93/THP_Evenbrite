module ApplicationHelper

  def event_admin
    Event.find(params[:id]).admin.id 
  end

  def attendance_guests_list
    Event.find(params[:id]).attendances.where(guest:current_user.id)
  end

  def event_find
    Event.all.find(@id)
  end
end
