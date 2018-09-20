class Sector < ApplicationRecord
  has_many :users, :through => :user_sectors
  has_many :user_sectors
  has_many :messages, dependent: :destroy
end
