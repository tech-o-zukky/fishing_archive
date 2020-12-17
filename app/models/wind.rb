class Wind < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' }, 
    { id: 1, name: '無風(~1m)' }, 
    { id: 2, name: '微風(1~3m)' }, 
    { id: 3, name: '弱(3~5m)' }, 
    { id: 4, name: '中(5~7m)' }, 
    { id: 5, name: '強風(7m~)' }
  ]

  include ActiveHash::Associations
  has_many :records
end