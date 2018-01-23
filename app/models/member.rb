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

  has_many :meals

  def has_custom_email_domain
    %w[gmail.com yahoo.com aol.com @icloud.com @outlook.com].includes(email.split("@").last.trim.downcase)
  end



end
