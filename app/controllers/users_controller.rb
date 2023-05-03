class UsersController < ApplicationController
  before_action :find_user , only: %i[show, edit , update , destory]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(clean_user_data)

    if @user.save
      redirect_to root_path , aleart: '資料新增成功！!!!!!!!!!!!!!!!!!'
    else
      render :new
    end
  end

  def show
    puts  params[:id]
  end




  private
  def clean_user_data
    params.require(:user).permit(:ch_name ,:en_name ,:phone_number ,:b_day,:passport_number, :passport_date ,:passport_photo,:travel_url,:other)
  end

  def find_user
    @user = User.find_by(params[:id])
  end
end
