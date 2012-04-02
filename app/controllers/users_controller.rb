class UsersController < ApplicationController

  def index
    @users=User.find(:all)
  end
  
  def new
    puts "Inside User-NEW"
    @user = User.new
  end
  
  def create
    puts "Inside User-CREATE"
    @user = User.new(params[:user])
    if @user.save
      redirect_to :user_index, :notice=>"Signed Up!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.destroy(params[:id])
    redirect_to :index
  end

end
