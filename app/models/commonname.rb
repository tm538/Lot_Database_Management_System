class Commonname < ActiveRecord::Base

  validates :name, presence: true
end
