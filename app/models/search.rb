class Search < ActiveRecord::Base
      
  def find_lots
    lots = Lot.order(:id)
    lots = lots.where("id >= ?", from ) if from.present?
    lots = lots.where("id <= ?", to ) if to.present?
    lots = lots.where(id: lot) if lot.present?
    lots = lots.where(client_id: client) if client.present?
    lots = lots.where("samp_id like ?", "%#{samp_id}%") if samp_id.present?
    lots = lots.where(commercial: com) if com.present?
    lots = lots.where("site like ?", "%#{site}%") if site.present?
    lots = lots.where("phylum like ?", "%#{phylum}%") if phylum.present?
    lots = lots.where("genus like ?", "%#{genus}%") if genus.present?
    lots = lots.where("l_class like ?", "%#{l_class}%") if l_class.present?
    lots = lots.where("species like ?", "%#{species}%") if species.present?
    lots
  end
  
end