class Group < ApplicationRecord
  has_many :memberships
  has_many :members, -> { distinct }, :through => :memberships, dependent: :destroy

  serialize :organization_info

  before_create :retrieve_organization_info_and_set_name

  def all_meals
    members.map(&:meals).compact.flatten
  end

  def available_meals
    all_meals.select(&:is_available?)
  end

  protected

  def retrieve_organization_info_and_set_name
    if response = FullContact.company(domain: domain)
      self.name = humanize_company_name(response.organization.name)
      self.organization_info = response.except("status", "request_id")
    else
      self.name = "#{domain} Crew"
    end
  end

  def humanize_company_name(name)
    suffixes = %w[LLC L.L.C. Inc Inc. Co Co. Corp Corp. Ltd Ltd.]
    suffixes.each { |suff| name.include?(suff) && name.slice!(suff) }
    name.strip
  end

end
