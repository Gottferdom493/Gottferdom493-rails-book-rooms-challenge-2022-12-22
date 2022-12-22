class Hotel < ApplicationRecord
  belongs_to :user
  has_many :rooms, dependent: :destroy

  validates :name, :adresse, presence: true

end
