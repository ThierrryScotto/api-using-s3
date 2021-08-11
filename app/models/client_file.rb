class ClientFile < ApplicationRecord
  validates :name, presence: true
  validates :id_client, presence: true

  has_many :clients
end
