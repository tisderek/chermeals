class Meal < ApplicationRecord
  belongs_to :provider, class_name: "User"
  has_one :gift
  has_one :receiver, through: :gift

  def is_available?
    !receiver.present?
  end
end
