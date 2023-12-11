class Tool < ApplicationRecord
    belongs_to :tool_section

    has_many :posts
    has_many :features

    validates :title, presence: true
end
