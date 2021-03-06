class Meal < ApplicationRecord
  belongs_to :member
  has_one :gift
  has_one :receiver, through: :gift

  def is_available?
    !receiver.present?
  end
end
