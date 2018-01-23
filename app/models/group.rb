class Group < ApplicationRecord

  has_many :memberships
  has_many :members, -> { distinct }, :through => :memberships, dependent: :destroy

  def all_meals
    members.map(&:meals).compact.flatten
  end

  def available_meals
    all_meals.select(&:is_available?)
  end

end
