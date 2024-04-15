class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true, length: {maximum:25}
  validates :body, presence: true
end
