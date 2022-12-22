class Room < ApplicationRecord
  belongs_to :user
  belongs_to :hotel

  has_many :bookings, dependent: :destroy

  validates :capacity, :price, presence: true

end
