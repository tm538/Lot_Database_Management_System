module SessionsHelper

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
  
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
  
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      flash[:error] = "You don't have permision to do that."
      redirect_to(dashboard_path) 
    end
  end
    
  def admin_user
    unless current_user.admin?
      flash[:error] = "You don't have permision to do that."
      redirect_to(dashboard_path) 
    end
  end
  
  def correct_user_or_admin
    @user = User.find(params[:id])
    unless current_user.admin? or current_user?(@user)
      flash[:error] = "You don't have permision to do that."
      redirect_to(dashboard_path) 
    end
  end
    
  def staff_user
   unless signed_in? && current_user.role == 'Staff'
      flash[:error] = "You need to be a staff user to do that."
      redirect_to(dashboard_path) 
   end
  end 
  
  def staff_user?
    signed_in? && current_user.role == 'Staff'
  end
  
  def not_signed_in
    redirect_to(root_url) unless !signed_in?
  end
  
  def lot_restriction
    @lot = Lot.find(params[:id])
    unless @lot.restriction == 'All' or  current_user.role == 'Staff'
      flash[:error] = "You do not have permision to access that sample."
      redirect_to(dashboard_path) 
    end
  end
  
  def batch_restriction
    @batch = Batch.find(params[:id])
    unless @batch.restriction == 'All' or  current_user.role == 'Staff'
      flash[:error] = "You do not have permision to access that batch."
      redirect_to(dashboard_path) 
    end
  end
  
end
