class CreateUserSectors < ActiveRecord::Migration[5.0]
  def change
    create_table :user_sectors do |t|
    	t.integer :user_id
    	t.integer :sector_id
      	t.timestamps
    end
  end
end
