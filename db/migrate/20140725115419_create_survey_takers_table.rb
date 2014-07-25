class CreateSurveyTakersTable < ActiveRecord::Migration
  def change
  	create_table :name do |t|
  		t.string :field
  		t.integer :field
  		t.references :object
  		
  		t.timestamps
  	end

  end
end
