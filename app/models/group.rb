class Group < ApplicationRecord
  has_many :memberships
  has_many :members, -> { distinct }, :through => :memberships, dependent: :destroy

  serialize :organization_info

  before_validation :get_organization_info, on: :create
  before_validation :ensure_name_is_present, on: :create
  before_create :sanitize_company_name, on: :create, if: :organization_info

  validates_uniqueness_of :domain
  validates_presence_of :name

  def meals
    members.map{ |x| x.meals.includes(:receiver) }.compact.flatten
  end

  scope :available_meals, -> { where }

  def available_meals
    meals.select(&:is_available?)
  end

  def unavailable_meals
    meals.reject(&:is_available?)
  end

  protected

  def get_organization_info
    response = FullContact.company(domain: domain)
    rescue FullContact::Error => e
      logger.error e.message
      logger.error e.backtrace.join("\n")
    else
      self.organization_info = response.dig(:organization, :name) && response.except("status", "request_id")
  end

  def ensure_name_is_present
    name_from_fullcontact_api = organization_info.present? && organization_info.dig(:organization, :name)
    self.name = name_from_fullcontact_api.present? ? name_from_fullcontact_api : "The #{domain} crew"
  end

  def sanitize_company_name
    suffixes = %w[LLC L.L.C. Inc Inc. Co Co. Corp Corp. Ltd Ltd.]
    suffixes.each { |suff| name.include?(suff) && name.slice!(suff) }
    self.name = name.strip.gsub(/\W+\s+\W+\Z/, "")
  end

end
