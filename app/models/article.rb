class Article < ApplicationRecord
  belongs_to :section

  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 10 }
end
