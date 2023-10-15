class Chat < ApplicationRecord
  has_many :messages, -> { sorted }, dependent: :destroy
  belongs_to :user

  validates :user, presence: true
end
