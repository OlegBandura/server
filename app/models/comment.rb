class Comment < ApplicationRecord
  belongs_to :article
  validates :comment, presence: true
end
