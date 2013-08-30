class SampletypesController < ApplicationController
  before_action :staff_user, only: [:create, :new, :update, :show, :index] 
    
  def show
      @sampletype = Sampletype.find(params[:id])
  end
  
  def index
      @sampletypes = Sampletype.paginate(page: params[:page], :per_page => 30)
  end
  
  def new
    @sampletype = Sampletype.new
  end
  
  def create
   @sampletype = Sampletype.new(sampletype_params)
    if @sampletype.save
      flash[:success] = "Sample type " + @sampletype.name.to_s + " sucessfully created"
      redirect_to dashboard_path
    else
      render 'new'
    end
  end
  
  def edit
     @sampletype = Sampletype.find(params[:id])
  end

  def update
     @sampletype = Sampletype.find(params[:id])
    if @sampletype.update_attributes(sampletype_params)
      flash[:success] = "Sample type updated"
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end
  
  def sampletype_params
      params.require(:sampletype).permit(:name)
    end
end