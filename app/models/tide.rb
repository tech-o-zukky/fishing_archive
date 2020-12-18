class Tide < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' }, 
    { id: 1, name: '大潮' }, 
    { id: 2, name: '中潮' }, 
    { id: 3, name: '小潮' }, 
    { id: 4, name: '長潮' }, 
    { id: 5, name: '若潮' }
  ]

  include ActiveHash::Associations
  has_many :records
end