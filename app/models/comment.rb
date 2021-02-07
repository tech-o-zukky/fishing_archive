class Comment < ApplicationRecord
  # アソシエーション
  belongs_to :record
  belongs_to :user

  # バリデーション
  validates :comment_text,   presence: true
end
