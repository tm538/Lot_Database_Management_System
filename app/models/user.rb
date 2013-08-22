class User < ActiveRecord::Base
  #convert email to lowercase before saving to prevent duplication
  before_save { self.email = email.downcase }
  
  #Validate fields
  validates :name, presence: true, 
                   length: { maximum: 100 }
                   
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, 
                    length: { maximum: 200 }, 
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }
                    
  has_secure_password
  validates :password, length: { minimum: 6 }
end
