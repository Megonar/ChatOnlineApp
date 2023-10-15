class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  validates :text, presence: true, length: { maximum: 200 }

  scope :sorted, -> { order(created_at: :asc) }
end
