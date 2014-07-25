class CreateChoicesTable < ActiveRecord::Migration
  def change
  	create_table :choices do |t|
  		t.string :label
  		t.references :question
  		
  		t.timestamps
  	end

  end
end
