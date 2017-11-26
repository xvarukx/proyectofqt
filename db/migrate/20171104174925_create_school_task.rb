class CreateSchoolTask < ActiveRecord::Migration
  def change
    create_table :schools_tasks do |t|
      t.integer :school_id
      t.integer :task_id
    end
  end
end
