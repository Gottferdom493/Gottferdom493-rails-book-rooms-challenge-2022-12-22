class Room < ApplicationRecord
  belongs_to :user
  belongs_to :hotel

  validates :capacity, :price, presence: true

end
