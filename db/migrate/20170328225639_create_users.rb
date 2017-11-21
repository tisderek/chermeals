class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string            :name, null: false, default: ""
      t.belongs_to        :group, optional: true

      t.timestamps
    end
  end
end
