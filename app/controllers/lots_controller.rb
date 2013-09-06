class LotsController < ApplicationController
  
  def show
    @lot = Lot.find(params[:id])
    @client = Client.find(@lot.client_id)
    @versions = @lot.versions
  end
  
  def new
    @lot = Lot.new(:commercial => false, :client_id => 1, :created_at => Time.now)
  end
  
  def index
    @lots = Lot.paginate(page: params[:page], :per_page => 10)
  end
  
  def create
    @lot = Lot.new(lot_params)
    @lot.data_entered_by = current_user.id
    @lot.user_id = current_user.id
    @lot.returned = "NO"
    if @lot.save
      flash[:success] = "Lot number:" + @lot.id.to_s + ", sucessfully created."
      redirect_to dashboard_path
    else
      render 'new'
    end
  end
  
  def edit
      @lot = Lot.find(params[:id])
      @user = User.find(@lot.data_entered_by)
      @client = Client.find(@lot.client_id)
  end
  
  def update
    @lot = Lot.find(params[:id])
    
    attributes = lot_params.clone
    
    if @lot.returned == "YES" && @lot.return_date.blank? 
       attributes[:return_date] = Time.now
    end
    
    if @lot.update_attributes(attributes)
      flash[:success] = "Lot number:" + @lot.id.to_s + ", updated"
      redirect_to dashboard_path
    else
      @lot = Lot.find(params[:id])
      @user = User.find(@lot.data_entered_by)
      flash[:error] = "Error Lot number:" + @lot.id.to_s + ", was not updated"
      render 'edit'
    end
  end
  
  
  private

    def lot_params
      params.require(:lot).permit(:client_id, 
                                  :commercial, 
                                  :commonname_id, 
                                  :analysis_by, 
                                  :samp_id,
                                  :sampletype_id,
                                  :commonname_id,
                                  :phylum,
                                  :l_class,
                                  :genus,
                                  :species,
                                  :sample_form,
                                  :to_return,
                                  :region,
                                  :site,
                                  :analysis_by,
                                  :extra_info,
                                  :created_at,
                                  :isotopes,
                                  :zooms,
                                  :aar,
                                  :lipid,
                                  :dna,
                                  :analysis_other,
                                  :returned,
                                  :archive_box,
                                  :return_date
                                  )
    end
  
end