class Membership < ApplicationRecord
  belongs_to :group
  belongs_to :member

  validates_uniqueness_of :group_id, :scope => :member_id
  validates_uniqueness_of :member_id, :scope => :group_id
end
