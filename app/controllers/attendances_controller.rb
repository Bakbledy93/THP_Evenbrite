class AttendancesController < ApplicationController
  def new
    @id = params[:id]
    puts "alert "*10 
    puts @price
    puts "alert "*10 
  end

  def create
    @attendance = Attendance.new(post_params)
    @attendance.guest_id = current_user.id
    puts @attendance.save
    if @attendance.save
      @id = @attendance.id
      redirect_to "/attendances/#{@id}", :notice => "User saved"
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
