class Admin::UsersController < ApplicationController
  def index
  end

  def destroy
    User.delete(params[:id])
    render 'index'
  end

  def edit
  end
  
end
