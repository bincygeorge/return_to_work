class CreatePlannerItems < ActiveRecord::Migration[8.1]
  def change
    create_table :planner_items do |t|
      t.string :title
      t.text :description
      t.string :category
      t.date :scheduled_date
      t.time :start_time
      t.time :end_time
      t.boolean :completed

      t.timestamps
    end
  end
end
