class LotsController < ApplicationController
  
  def new
    @lot = Lot.new(:commercial => false, :client_id => 1, :created_at => Time.now)
  end
  
  def index
    @lots = Lot.paginate(page: params[:page], :per_page => 30)
    @search = Search.new
  end
  
  def create
    @lot = Lot.new(lot_params)
    @lot.data_entered_by = current_user.id
    if @lot.save
      flash[:success] = "lot number:" + @lot.id.to_s + ", sucessfully created."
      redirect_to dashboard_path
    else
      render 'new'
    end
  end
  
  def edit
      @lot = Lot.find(params[:id])
      @user = User.find(@lot.data_entered_by)
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
                                  :analysis_other
                                  )
    end
  
end