class Recipe < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name, length:{maximum: 35}
    validates :persons
    validates :recipe
    validates :is_public
    validates :time, allow_blank: true
    validates :tips, allow_blank: true
    validates :calories, allow_blank: true
  end


end
