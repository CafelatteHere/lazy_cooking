class Recipe < ApplicationRecord
  with_options presence: true do
    validates :name, length:{maximum: 35}
    validates :persons
    validates :recipe
    validates :is_public
  end

  with_options allow_blanc: true do
    validates :time
    validates :tips
    validates :calories
  end
end
