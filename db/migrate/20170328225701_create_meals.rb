class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.string                  :main_title
      t.string                  :vendor
      t.date                    :expected_date
      t.belongs_to              :provider

      t.timestamps
    end
  end
end
