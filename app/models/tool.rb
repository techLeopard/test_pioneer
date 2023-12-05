class Tool < ApplicationRecord
    has_many :posts
    has_many :features

    validates :title, presence: true
end
