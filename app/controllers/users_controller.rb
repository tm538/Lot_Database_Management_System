class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :show, :create]
  before_action :staff_user, only: [:create, :new] 
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
    
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
        redirect_to @user
      else
        render 'edit'
      end
    end

    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User Deleted."
      redirect_to users_url
    end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :role)
    end
  
    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
      
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
      
    def staff_user
      redirect_to(root_url) unless signed_in? && current_user.role == 'Staff'
    end   
end
