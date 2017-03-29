class Gift < ApplicationRecord
  belongs_to :provider, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :meal
end