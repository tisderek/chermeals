class User < ApplicationRecord
  has_many :provided_gifts, class_name: 'Gift', foreign_key: 'provider_id'
  has_many :received_gifts, class_name: 'Gift', foreign_key: 'receiver_id'
  has_many :provided_meals, class_name: 'Meal', foreign_key: 'provider_id'
end
