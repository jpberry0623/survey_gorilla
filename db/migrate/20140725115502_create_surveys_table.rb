class CreateSurveysTable < ActiveRecord::Migration
  def change
  	create_table :surveys do |t|
  		t.string :name
  		t.references :creator_user
  		t.references :access_level
  		
  		t.timestamps
  	end

  end
end
