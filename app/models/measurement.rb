class Measurement < ActiveHash::Base
  self.data = [
    {id: 1, name: '--'},
    {id: 2, name: 'kg'},
    {id: 3, name: 'ml'},
    {id: 4, name: 'g'},
    {id: 5, name: '大さじ'},
    {id: 6, name: '小さじ'},
    {id: 7, name: '個'},
    {id: 8, name: 'お好みで'},
    {id: 9, name: '少々'},
  ]

  include ActiveHash::Associations
  has_many :ingredients
end
