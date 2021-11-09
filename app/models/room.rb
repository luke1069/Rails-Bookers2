class Room < ApplicationRecord

  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

end
