class Lot < ActiveRecord::Base

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |lot|
        csv << lot.attributes.values_at(*column_names)
      end
    end
  end

  default_scope -> { order('id DESC') }
  validates :client_id, presence: true 
  validates :commercial, :inclusion => {:in => [true, false]}
  validates :commonname_id, presence: true
  validates :analysis_by, presence: true
  validates :sample_form, presence: true
  validates :sampletype_id, presence: true
  
  has_paper_trail
end
