class Wave < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' }, 
    { id: 1, name: '0m' }, 
    { id: 2, name: '0.5m' }, 
    { id: 3, name: '1m' }, 
    { id: 4, name: '1.5m' }, 
    { id: 5, name: '2m' }, 
    { id: 6, name: '2.5m' }, 
    { id: 7, name: '3m' }, 
    { id: 8, name: '3.5m' }, 
    { id: 9, name: '4m以上' }
  ]

  include ActiveHash::Associations
  has_many :records
end