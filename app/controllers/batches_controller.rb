class BatchesController < ApplicationController
before_action :signed_in_user, only: [:edit, :index, :update, :show, :create, :destroy]
before_action :batch_restriction, only: [:edit, :update, :show]
    
  def show
    @batch = Batch.find(params[:id])
    @lots = Lot.where(batch_id: params[:id])
    respond_to do |format|
      format.html
      format.csv { send_data @lots.to_csv, filename: "Batch_" + @batch.name + ".csv"}
     end 
  end
  
  def index
    @batches = Batch.paginate(page: params[:page], :per_page => 30)
  end
  
  def new
    @batch = Batch.new(:client_id => 2, :commercial => staff_user?, :restriction => 'All')
  end
  
  def create
    @batch = Batch.new(batch_params)
    @batch.user_id = current_user.id
    if @batch.save
      flash.now[:success] = "Batch " + @batch.name.to_s + " sucessfully created"
      redirect_to edit_batch_path(@batch)
    else
      render 'new'
    end
  end
  
  def edit
    @batch = Batch.find(params[:id])
    @lots = Lot.where(batch_id: params[:id])
    if @lots.empty? 
      flash.now[:notice] = "No samples are currently assigned to this batch, please complete all details for the first sample."
      @lot = Lot.new(:commercial => @batch.commercial,
                     :restriction => @batch.restriction, 
                     :client_id => @batch.client_id, 
                     :batch_id => params[:id], 
                     :created_at => Time.now
                    )
    else 
      @lot = Lot.new
      @lot = @lots.order("id DESC").first
      @lot.id = nil
      @lot.samp_id = nil
      
    end 
  end
  
  private
  def batch_params
      params.require(:batch).permit(:id, :name, :client_id, :restriction, :commercial, :extra)
  end
  
  def lot_params
      params.require(:lot).permit(:id,
                                  :client_id, 
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
                                  :return_date,
                                  :restriction,
                                  :batch_id
                                  )
    end
end
