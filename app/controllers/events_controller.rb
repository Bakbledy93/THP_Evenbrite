class EventsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit]

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_user_session_path
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

  private
  def post_params
    params.permit(:start_date, :duration, :title, :description, :price, :location, :admin_id)
  end
  



end

