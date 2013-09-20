class StaticPagesController < ApplicationController
before_action :signed_in_user, only: [:dashboard]

  def home
    redirect_to dashboard_path unless !signed_in?
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
  
  def dashboard
    @search = Search.new
  end
  
  def search
  end
  
  def statistics
  end
  
end
