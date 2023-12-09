class Section < ApplicationRecord
    belongs_to :position
    
    has_many :articles, dependent: :destroy

end
