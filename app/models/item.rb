class Item < ApplicationRecord
  belongs_to :calendar

  validates :is_checked, inclusion: [true, false]
  validates :calendar, presence: true
end
