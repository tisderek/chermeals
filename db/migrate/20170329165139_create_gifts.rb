class CreateGifts < ActiveRecord::Migration[5.0]
  def change
    create_table :gifts do |t|
      t.belongs_to      :provider
      t.belongs_to      :receiver
      t.belongs_to      :meal

      t.timestamps
    end
  end
end
