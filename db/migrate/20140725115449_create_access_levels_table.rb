class CreateAccessLevelsTable < ActiveRecord::Migration
  def change
  	create_table :access_levels do |t|
  		t.string :name
  		
  		t.timestamps
  	end

  end
end
