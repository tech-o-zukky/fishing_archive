class WaterQuality < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' }, 
    { id: 1, name: 'クリア' }, 
    { id: 2, name: 'やや濁り' }, 
    { id: 3, name: '濁り' }, 
    { id: 4, name: '超濁り' }
  ]

  include ActiveHash::Associations
  has_many :records
end