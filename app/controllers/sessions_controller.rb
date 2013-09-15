class SessionsController < ApplicationController
before_action :not_signed_in, only: :new 

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) && !user.disabled
      sign_in user
      redirect_back_or dashboard_path
    else
      if user && user.authenticate(params[:session][:password])
        flash.now[:error] = 'Account disabled please contact support.'
      else    
        flash.now[:error] = 'Invalid email/password combination.'
      end
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
  
end
