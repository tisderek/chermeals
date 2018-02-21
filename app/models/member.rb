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

  validates_email :email,
    check_mx: true,
    not_disposable: true,
    not_free: true,
    not_blacklisted: true,
    block_special_usernames: true,
    message: "You must register with your work email!"

  protected


end
