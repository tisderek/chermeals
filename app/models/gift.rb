class Gift < ApplicationRecord
  belongs_to :provider, class_name: 'Member'
  belongs_to :receiver, class_name: 'Member'
  belongs_to :meal
end