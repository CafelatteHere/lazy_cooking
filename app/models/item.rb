class Item < ApplicationRecord
  validates :is_checked, inclusion: [true, false]
  validates :calendar, presence: true
end
