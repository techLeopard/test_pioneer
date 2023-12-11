class ToolSection < ApplicationRecord
  belongs_to :position
  has_many :tools
end
