class Task < ActiveRecord::Base
  has_and_belongs_to_many :schools
  belongs_to :team

  def get_team_users
    users = team.users.map do |user|
      {email: user.email, avatar: user.avatar.url(:thumb)}
    end

    users.to_json
  end

  def self.list_of_states
    [['Sin Empezar','Sin Empezar'],['En Proceso','En Proceso'],['Terminada','Terminada']]
  end
end
