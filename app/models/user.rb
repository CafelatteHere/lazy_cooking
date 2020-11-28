class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, authentication_keys: [:email]

  has_many :recipes

  with_options presence: true do
    validates :nickname, length:{maximum: 20}
    validates :name, length: {maximum: 15}
    validates :surname, length: {maximum: 15}
    validates :birthday
    validates :country_id, allow_blank: true, numericality: { other_than: 1 }
    validates :about_me, allow_blank: true
  end
end
