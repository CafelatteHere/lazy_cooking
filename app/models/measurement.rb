class Measurement < ActiveHash::Base
  self.data = [
    {id: 1, name: 'g'},
    {id: 2, name: 'ml'},
    {id: 3, name: '大さじ'},
    {id: 4, name: '小さじ'},
    {id: 5, name: '個'},
    {id: 6, name: '枚'},
    {id: 7, name: 'お好みで'},
    {id: 8, name: '少々'}
  ]

  include ActiveHash::Associations
  has_many :ingredients
end
