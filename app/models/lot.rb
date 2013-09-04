class Lot < ActiveRecord::Base

  default_scope -> { order('id DESC') }
  validates :client_id, presence: true 
  validates :commercial, :inclusion => {:in => [true, false]}
  validates :commonname_id, presence: true
  validates :analysis_by, presence: true
  validates :sample_form, presence: true
  validates :sampletype_id, presence: true
  
  
end
