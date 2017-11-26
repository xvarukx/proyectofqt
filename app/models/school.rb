class School < ActiveRecord::Base

  has_and_belongs_to_many :tasks
  belongs_to :zone

  def self.list_of_schools
    School.pluck(:name,:id)
  end
  def self.list_schools
    School.all
  end


end
