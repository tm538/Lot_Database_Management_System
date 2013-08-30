class LotsController < ApplicationController
  
  def new
    @lot = Lot.new(:commercial => false, :client_id => 1, :created_at => Time.now)
    @lot.data_entered_by = current_user.id
  end
  
end