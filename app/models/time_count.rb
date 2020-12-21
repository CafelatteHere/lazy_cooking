class TimeCount < ActiveHash::Base
  self.data = [
    {id: 1, name: '--'},
    {id: 2, name: '以内10'},
    {id: 3, name: '15'},
    {id: 4, name: '20'},
    {id: 5, name: '30'},
    {id: 6, name: '40'},
    {id: 7, name: '50'},
    {id: 8, name: '1時00'},
    {id: 9, name: '1時15'},
    {id: 10, name: '1時30'},
    {id: 11, name: '1時45'},
    {id: 12, name: '2時00'},
    {id: 13, name: '2時30'},
    {id: 14, name: '3時00'},
    {id: 15, name: '3時30'},
    {id: 16, name: '4時間以上'}
  ]

  include ActiveHash::Associations
  has_many :recipes
end
