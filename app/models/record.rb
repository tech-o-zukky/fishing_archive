class Record < ApplicationRecord
    # ActiveHash用アソシエーション
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :tide
    belongs_to_active_hash :water_quality
    belongs_to_active_hash :wave
    belongs_to_active_hash :weather
    belongs_to_active_hash :wind
  
    # アソシエーション
    belongs_to :user
    has_many_attached :images
  
    # バリデーション
    validates :title,            presence: true
    validates :date,             presence: true
    validates :content,          presence: true

    # ActiveHash利用カラムのバリデーション
    validates :prefecture_id,    presence: true, numericality: { other_than: 0, message: "を選択してください。" }
end
