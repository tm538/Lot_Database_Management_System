class StaticPagesController < ApplicationController
  def home
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
end
