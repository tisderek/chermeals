class Member < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :memberships
  has_many :groups, -> { distinct }, :through => :memberships, dependent: :destroy

  has_many :meals
  has_many :provided_gifts, class_name:   'Gift',
                            foreign_key:  'provider_id'
  has_many :received_gifts, class_name:   'Gift',
                            foreign_key:  'receiver_id'

  validates_presence_of :name
  validates_email :email, not_free: true, message: "You must register with your work email!"

  after_create :join_or_create_group

  def group
    groups.first
  end

  protected

  def join_or_create_group
    group = Group.find_or_create_by(domain: email.split('@').last)
    group.members << self
  end

end
