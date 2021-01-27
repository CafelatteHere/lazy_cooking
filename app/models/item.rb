class Item < ApplicationRecord

  # validates :is_checked, inclusion: [true, false]
  validates :name, presence: true, length: { maximum: 40 }
  validates :quantity, length: {maximum: 15 }
end
