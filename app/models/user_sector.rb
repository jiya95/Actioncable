class UserSector < ApplicationRecord
	belongs_to :user, :class_name => "User", :foreign_key => "user_id"
	belongs_to :sector, :class_name => "Sector", :foreign_key => "sector_id"
end
