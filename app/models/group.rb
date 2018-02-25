class Group < ApplicationRecord
  has_many :memberships
  has_many :members, -> { distinct }, :through => :memberships, dependent: :destroy

  serialize :organization_info

  before_validation :get_organization_info, on: :create
  before_validation :set_name, on: :create
  before_create :sanitize_company_name, on: :create, if: :organization_info

  validates_uniqueness_of :domain
  validates_presence_of :name

  def all_meals
    members.map(&:meals).compact.flatten
  end

  def available_meals
    all_meals.select(&:is_available?)
  end

  protected

  def get_organization_info
    response = FullContact.company(domain: domain)
    rescue FullContact::NotFound
    else
      self.organization_info = response.except("status", "request_id")
  end

  def set_name
    self.name = organization_info.present? ? organization_info.organization.name : "The #{domain} crew"
  end

  def sanitize_company_name
    suffixes = %w[LLC L.L.C. Inc Inc. Co Co. Corp Corp. Ltd Ltd.]
    suffixes.each { |suff| name.include?(suff) && name.slice!(suff) }
    self.name = name.strip.gsub(/\W+\s+\W+\Z/, "")
  end

end
