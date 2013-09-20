class ClientsController < ApplicationController
    before_action :staff_user, only: [:create, :new, :update, :show, :index] 
    
  def show
      @client = Client.find(params[:id])
  end
  
  def index
      @clients = Client.paginate(page: params[:page], :per_page => 10)
  end
  
  def new
    @client = Client.new
  end
  
  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:success] = "Client " + @client.org.to_s + " sucessfully created"
      redirect_to dashboard_path
    else
      render 'new'
    end
  end
  
  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(client_params)
      flash[:success] = "Client updated"
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end
  
  def destroy
      Client.find(params[:id]).destroy
      flash[:success] = "Client Deleted."
      redirect_to clients_url
  end
  
  def client_params
      params.require(:client).permit(:org, :contact_name, :address, :email, :extra)
  end
end