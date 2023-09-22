class Tag < ApplicationRecord
    validates :name, presence: true
    has_many :play_tag_relations, dependent: :destroy
    has_many :plays, through: :play_tag_relations, dependent: :destroy
end
