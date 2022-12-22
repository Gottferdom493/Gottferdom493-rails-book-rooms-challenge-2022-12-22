class Hotel < ApplicationRecord
  belongs_to :user
  has_many :rooms

  validates :name, :adresse, presence: true

end
