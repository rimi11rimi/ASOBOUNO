class PlayTagRelation < ApplicationRecord
  belongs_to :play
  belongs_to :tag
end
