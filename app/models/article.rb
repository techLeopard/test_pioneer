class Article < ApplicationRecord
  belongs_to :section
  has_many :practical_tasks

  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 10 }
end
