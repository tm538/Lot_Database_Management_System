class Batch < ActiveRecord::Base
  
  validates :name, presence: true, 
                  length: { maximum: 250 }
  validates :client_id, presence: true
  validates :commercial, :inclusion => {:in => [true, false]}
  validates :restriction, presence: true
end
