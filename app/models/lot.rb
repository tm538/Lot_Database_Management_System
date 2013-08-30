class Lot < ActiveRecord::Base

  default_scope -> { order('id DESC') }
  validates :client_id, presence: true 
  validates :commercial, presence: true
end
