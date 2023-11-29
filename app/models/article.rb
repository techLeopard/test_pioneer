class Article < ApplicationRecord
  belongs_to :section
  belongs_to :tool
  

  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 10 }
end
