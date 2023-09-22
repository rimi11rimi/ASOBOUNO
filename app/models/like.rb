class Like < ApplicationRecord
  belongs_to :play
  belongs_to :user

  validates_uniqueness_of :play_id, scope: :user_id
end
