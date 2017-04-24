class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.string                  :main_title
      t.string                  :sub_title
      t.string                  :description
      t.string                  :cook_time
      t.integer                 :servings_count #remove
      t.integer                 :calories_count
      t.date                    :expected_date
      t.belongs_to              :provider
      t.string                  :hero_image

      t.timestamps
    end
  end
end
