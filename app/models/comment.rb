class Comment < ApplicationRecord
  # アソシエーション
  belongs_to :record
  belongs_to :user
end
