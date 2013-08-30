class CommonnamesController < ApplicationController
  before_action :staff_user, only: [:create, :new, :update, :show, :index] 
    
  def show
      @commonname = Commonname.find(params[:id])
  end
  
  def index
      @commonnames = Commonname.paginate(page: params[:page], :per_page => 30)
  end
  
  def new
    @commonname = Commonname.new
  end
  
  def create
    @commonname = Commonname.new(commonname_params)
    if @commonname.save
      flash[:success] = "Common Name " + @commonname.name.to_s + " sucessfully created"
      redirect_to dashboard_path
    else
      render 'new'
    end
  end
  
  def edit
    @commonname = Commonname.find(params[:id])
  end

  def update
    @commonname = Commonname.find(params[:id])
    if @commonname.update_attributes(commonname_params)
      flash[:success] = "Common Name updated"
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end
  
  def commonname_params
      params.require(:commonname).permit(:name)
    end
end