class LotsController < ApplicationController
before_action :signed_in_user, only: [:edit, :update, :show, :index, :create, :destroy]
before_action :lot_restriction, only: [:edit, :update, :destroy, :show]

autocomplete :phylum, :name
autocomplete :l_class, :name
autocomplete :genus, :name
autocomplete :species, :name
  
  def show
    @lot = Lot.find(params[:id])
    @client = Client.find(@lot.client_id)
    @versions = @lot.versions
  end
  
  def new
    @lot = Lot.new(:commercial => false, :restriction => "All", :client_id => 1, :created_at => Time.now)
    flash.now[:notice] = "Please complete all mandatory and relevent fields for this sample."
  end
  
  def index
    @lots = Lot.paginate(page: params[:page], :per_page => 100)
    @lots_all = Lot.all
    respond_to do |format|
      format.html
      format.csv { send_data @lots_all.to_csv, filename: "LDMS-all-lots-" + Date.today.to_s + ".csv"}
     end 
  end
  
  def create
    @lot = Lot.new(lot_params)
    @lot.data_entered_by = current_user.id
    @lot.user_id = current_user.id
    @lot.returned = "NO"
    @lot.created_at = Time.now
    if @lot.save
      if @lot.batch_id.nil?
        flash[:success] = "Lot number: " + @lot.id.to_s + ", generated."
        redirect_to dashboard_path
      else
        flash[:success] = "Lot number: " + @lot.id.to_s + ", generated and added to batch." 
        redirect_to edit_batch_path(@lot.batch_id)
      end 
    else
      if @lot.batch_id.nil?
        render 'new'
      else
        @lots = Lot.where(batch_id: @lot.batch_id)
        @batch = Batch.find(@lot.batch_id) 
        render 'batches/edit'
      end 
    end
  end
  
  def edit
      @lot = Lot.find(params[:id])
      @user = User.find(@lot.data_entered_by)
      @client = Client.find(@lot.client_id)
  end
  
  def edit_multiple
    @lots = Lot.find(params[:lot_ids])
  end
  
  def update_multiple
    @lots = Lot.find(params[:lot_ids])
    @lots.reject! do |lot|
      lot.update_attributes(lot_params.reject { |k,v| v.blank? })
    end
    if @lots.empty?
      flash[:success] = "Lots updated."
      redirect_to dashboard_path
    else
      @lot = Lot.new(params[:lot])
      render "edit_multiple"
    end
  end
  
  def update
    @lot = Lot.find(params[:id])
    
    attributes = lot_params.clone
    
    if attributes[:returned] == "YES" && attributes[:return_date].blank? 
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
  
  def import 
    Lot.import(params[:file])
    flash.now[:success] = "Lot numbers, imported."
    redirect_to dashboard_path
  end
  
  
  def quick
    @lots = Lot.where(samp_id: params[:id])
    if params[:id].empty?
      flash[:error] = "Search Parameters empty please try again."
    elsif @lot = Lot.find_by_id(params[:id])
      redirect_to edit_lot_path(@lot)
    elsif @lots.count == 1
      redirect_to edit_lot_path(@lots.first)    
    elsif @lots.count > 1
      flash[:error] = "Too many results found for search parameters " + params[:id].to_s + ". Please use full search feature."
      redirect_back_or dashboard_path
    else
      flash[:error] = "No lot number or sample ID found for search parameters " + params[:id].to_s + "."
      redirect_back_or dashboard_path
    end 
  end
  
  private

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
                                  :batch_id,
                                  :town,
                                  :Latitude,
                                  :Longitude,
                                  :county,
                                  :district,
                                  :parish,
                                  :gisdataset
                                  )
    end
  
end