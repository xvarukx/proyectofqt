class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.string :state
      t.date :task_date
      t.integer :team_id

      t.timestamps
    end
  end
end
