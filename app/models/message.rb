class Message < ApplicationRecord
  has_many :inboxes
  validates :content, presence: true
end