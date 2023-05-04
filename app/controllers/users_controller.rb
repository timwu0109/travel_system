class UsersController < ApplicationController
  before_action :find_user , only: [ :show, :edit , :update , :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(clean_user_data)

    if @user.save
      redirect_to users_path, alert:'資料新增成功！!!!!!!!!!!!!!!!!!'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(clean_user_data)
      redirect_to users_path, alert:'資料編輯成功！'
    else
      render :edit
    end

  end


  def destroy
    @user.destroy
    redirect_to users_path, alert:'資料已刪除!'
  end

  private
  def clean_user_data
    params.require(:user).permit(:ch_name ,:en_name ,:phone_number ,:b_day,:passport_number, :passport_date ,:passport_photo,:travel_url,:other)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
