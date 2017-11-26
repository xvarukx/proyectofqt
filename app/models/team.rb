class Team < ActiveRecord::Base

 has_and_belongs_to_many :users
 has_many :tasks
 def self.list_of_teams
    Team.pluck(:name,:id)
 end

end
