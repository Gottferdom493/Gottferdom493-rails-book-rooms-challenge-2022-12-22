class Hotel < ApplicationRecord
  belongs_to :user

  validates :name, :adresse, presence: true

end
