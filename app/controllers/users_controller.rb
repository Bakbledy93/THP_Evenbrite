class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index, :new, :edit]

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_user_session_path
    end
  end

  def show  
    @id = current_user.id
  end

  def new
    @user = User.new
  end


end
