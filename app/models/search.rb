class Search < ActiveRecord::Base
   
   
  def find_lots
    Lot.where(conditions)
  end
 
  private
 
  def site_conditions
    ["lots.site LIKE ?", "%#{site}%"] unless site.blank?
  end
  
  def phylum_conditions
    ["lots.phylum LIKE ?", "%#{phylum}%"] unless phylum.blank?
  end
  
  def class_conditions
    ["lots.l_class LIKE ?", "%#{l_class}%"] unless l_class.blank?
  end
  
  def genus_conditions
    ["lots.genus LIKE ?", "%#{genus}%"] unless genus.blank?
  end
  
  def species_conditions
    ["lots.species LIKE ?", "%#{species}%"] unless species.blank?
  end
  
  def from_conditions
    ["lots.id >= ?", from] unless from.blank?
  end
  
  def to_conditions
    ["lots.id <= ?", to] unless to.blank?
  end
  
  def id_conditions
    ["lots.id = ?", lot] unless lot.blank?
  end
  
  def client_conditions
    ["lots.client_id = ?", client] unless client.blank?
  end
  
  def client_conditions
    ["lots.commercial = ?", com] unless com.blank?
  end
  
  def conditions
    [conditions_clauses.join(' AND '), *conditions_options]
  end
  
  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end
  
  def conditions_options
    conditions_parts.map { |condition| condition[1..-1] }.flatten
  end
  
  def conditions_parts
    private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
  end
  
end