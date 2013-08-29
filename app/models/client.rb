class Client < ActiveRecord::Base
  before_save { self.email = email.downcase }
  
  #Validate fields
  validates :org, presence: true, 
                  length: { maximum: 250 },
                  uniqueness: { case_sensitive: false }
                   
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, 
                    length: { maximum: 200 }, 
                    format: { with: VALID_EMAIL_REGEX }
                    
  validates :address, presence: true
  
end
