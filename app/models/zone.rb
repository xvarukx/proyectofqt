class Zone < ActiveRecord::Base
  has_many :schools
  def self.list_of_zones
    Zone.pluck(:name,:id)
  end


end
