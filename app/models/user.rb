class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sectors, :through => :user_sectors
  has_many :user_sectors
  has_one :role, dependent: :destroy, autosave: true

  accepts_nested_attributes_for :role
  has_many :messages, dependent: :destroy
  def name
  	email.split('@')[0]
	end
end

