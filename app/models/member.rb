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

  validates_email_strictness :email, not_free:false
  after_validation :set_free_email_provider

  protected

  def set_free_email_provider
    # workaround to simulate work emails
    if email.split('@').first.include? "+"
      self.free_email_provider = false
    else
      self.free_email_provider = EmailCheck::EmailAddress.new(email).free_email_provider?
    end
  end

end
