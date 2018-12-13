class Like < ApplicationRecord
  belongs_to :picture, counter_cache: :likes_count
  belongs_to :user
end
