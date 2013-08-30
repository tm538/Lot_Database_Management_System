class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :show, :create, :destroy]
  before_action :staff_user, only: [:create, :new] 
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :correct_user_or_admin, only: []
    
    def show
      @user = User.find(params[:id])
    end
    
    def index
      @users = User.paginate(page: params[:page], :per_page => 10)
    end
    
    def new
      @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "User " + @user.name.to_s + " sucessfully created"
          redirect_to @user
        else
          render 'new'
        end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      if @user.update_attributes(user_params)
        flash[:success] = "Profile updated"
        sign_in @user
        redirect_to dashboard_path
      else
        render 'edit'
      end
    end

    def update_password
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "Password updated"
        if @user == current_user 
          sign_in @user
        end
        redirect_to dashboard_path
      else
        render 'password'
      end
    end

    def password
      @user = User.find(params[:id])
    end

    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User Deleted."
      redirect_to users_url
    end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
    end

end
