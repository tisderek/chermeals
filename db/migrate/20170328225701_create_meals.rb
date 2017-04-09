class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.string          :title
      t.date            :expected_date
      t.belongs_to      :provider

      t.timestamps
    end
  end
end
