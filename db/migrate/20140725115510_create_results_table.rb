class CreateResultsTable < ActiveRecord::Migration
  def change
  	create_table :results do |t|
  		t.references :user
  		t.references :choice
  		t.string :geolocation
  		
  		t.timestamps
  	end

  end
end
