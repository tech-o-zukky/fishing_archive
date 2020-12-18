class Weather < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' }, 
    { id: 1, name: '晴れ' }, 
    { id: 2, name: '晴れ/曇り' }, 
    { id: 3, name: '晴れ/雨' }, 
    { id: 4, name: '晴れ/雪' }, 
    { id: 5, name: '曇り/晴れ' }, 
    { id: 6, name: '曇り/雨' }, 
    { id: 7, name: '曇り/雪' }, 
    { id: 8, name: '小雨' }, 
    { id: 9, name: '雨' }, 
    { id: 10, name: '大雨' }, 
    { id: 11, name: '雨/晴れ' }, 
    { id: 12, name: '雨/曇り' }, 
    { id: 13, name: '雨/雪' }, 
    { id: 14, name: '大雪' }, 
    { id: 15, name: '雪/晴れ' }, 
    { id: 16, name: '雪/曇り' }, 
    { id: 17, name: '雪/雨' }
  ]

  include ActiveHash::Associations
  has_many :records
end