class CreateRoadmapGoals < ActiveRecord::Migration[8.1]
  def change
    create_table :roadmap_goals do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :status
      t.date :target_date

      t.timestamps
    end
  end
end
