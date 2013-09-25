class Lot < ActiveRecord::Base

  scope :commercial, where(:commercial => true)
  scope :non_commercial, where(:commercial => false)

  def self.total_on(month)
    where("date(created_at) >= ? AND date(created_at) < ?", month.beginning_of_month, month.end_of_month).count
  end
  
  def self.total_client_on(month, id)
    where("date(created_at) >= ? AND date(created_at) < ? AND client_id = ? AND commercial = ?", month.beginning_of_month, month.end_of_month, id, true).count
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << ["Lot_Number", "Client", "Client Contact Email" ,"Commercial", "Client_Sample_ID", "Sample_Type", "Common_Name",  "Phylum" , "Class" , "Genus" , "Species" , "Sample_Form" , "Region" , "Site" , "Analysis_by" , "Isotopes" , "ZooMS" , "AAR" , "Lipid" , "DNA" , "Other_Analysis" , "Return_Sample" , "Returned" , "Return_Date" , "Archive_Box" , "Extra_Info" , "Recieved_Date" , "Last_Updated" , "Created_by"] 
      all.each do |lot|
        @client = Client.find(lot.client_id)
        
        if lot.sampletype_id.presence
          @sampletype = Sampletype.find(lot.sampletype_id)
        end
        
        if lot.commonname_id.presence
          @commonname = Commonname.find(lot.commonname_id)     
        end
          
        if lot.analysis_by.presence
          @anal = User.find(lot.analysis_by)
        end  
        
        if lot.data_entered_by.presence
          @user = User.find(lot.data_entered_by)
        end
          
        csv << [lot.id , @client.org , @client.email , lot.commercial, lot.samp_id , @sampletype.name , @commonname.name , lot.phylum , lot.l_class , lot.genus , lot.species , lot.sample_form , lot.region , lot.site , @anal.name , lot.isotopes , lot.zooms , lot.aar , lot.lipid , lot.dna , lot.analysis_other , lot.to_return , lot.returned , lot.return_date.to_s.humanize , lot.archive_box , lot.extra_info , lot.created_at.to_s.humanize , lot.updated_at.to_s.humanize , @user.name]
      end
    end
  end
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      
    end
  end

  default_scope -> { order('id DESC') }
  validates :client_id, presence: true
  validates :commercial, :inclusion => {:in => [true, false]}
  validates :commonname_id, presence: true
  validates :analysis_by, presence: true
  validates :sample_form, presence: true
  validates :sampletype_id, presence: true
  validates :to_return, presence: true
  validates :samp_id, presence: true
  
  has_paper_trail
end
