class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string                  :name, null: false
      t.string                  :domain, unique: true
      t.string                  :description
      t.text                    :organization_info
      t.timestamps
    end

  end
end
