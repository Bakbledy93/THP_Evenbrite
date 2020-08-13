class EventsController < ApplicationController
  before_action :authenticate_user, only: [:index, :new, :edit]
  before_action :authenticate_current_user, only:[:edit,:delete]

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_user_session_path
    end
  end

  def authenticate_current_user
    @event = Event.find(params[:id])
    if current_user.id == @event.admin.id
      puts 'yey'
    else
      redirect_to events_path
      puts 'oh no'
    end
  end

  def index
    @events = Event.all
  end

  def show
    @id = params[:id]
  end

  def edit
    @id = params[:id]
    @events = Event.find(params[:id])
  end

  def new
  end

  def create
    @event = Event.new(post_params)
    @event.admin_id = current_user.id
    puts "///"*15
    puts post_params
    puts @event.save
    if @event.save
      @id = @event.id
      redirect_to "/events/#{@id}", :notice => "User saved"
      
    else
      puts "alert "*10 
      render "new", :alert => 'Alert message!'
      
    end
  end

  def destroy
    Event.delete(params[:id])
    render 'index'
  end

  private
  def post_params
    params.permit(:start_date, :duration, :title, :description, :price, :location, :admin_id)
  end

end

