class Group < ApplicationRecord
  has_many :users
  has_many :meals, through: :users, foreign_key: 'provider_id'
end
