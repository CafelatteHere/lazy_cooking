class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes
  has_one_attached :image

  with_options presence: true do
    validates :nickname, length:{maximum: 20}
    validates :name, length: {maximum: 15}
    validates :surname, length: {maximum: 15}
    validates :birthday
    validates :country_id, allow_blank: true, numericality: { other_than: 1 }
    validates :about_me, allow_blank: true
  end
end
