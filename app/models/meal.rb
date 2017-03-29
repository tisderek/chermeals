class Meal < ApplicationRecord
  belongs_to :provider, class_name: "User"
  has_one :gift
end
