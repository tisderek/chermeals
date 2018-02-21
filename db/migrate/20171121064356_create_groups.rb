class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string                  :name
      t.string                  :domain, unique: true
      t.string                  :description
      # t.string                  :whitelisted_email_domain

      t.timestamps
    end

  end
end
