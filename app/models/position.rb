class Position < ApplicationRecord
    has_many :sections
    has_many :tool_sections
end
