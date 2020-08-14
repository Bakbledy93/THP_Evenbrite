class Admin::EventsController < ApplicationController
  def index
  end

  def destroy
    User.delete(params[:id])
    render 'index'
  end

  def create
    @validate = params[:edit].to_i
    puts "*" * 20
    puts @validate
    puts "*" * 20
    @event = params[:events]
    a = Event.find(@event)
    if @validate == 1
      a.update(validated: true)
      redirect_to admin_events_path
    else
      a.update(validated: false)
      redirect_to admin_events_path
    end
    p a
  end
  
end
