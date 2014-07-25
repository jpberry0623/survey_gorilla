class CreateQuestionsTable < ActiveRecord::Migration
  def change
  	create_table :questions do |t|
  		t.references :question_type
  		t.references :survey
  		t.string :prompt
  		
  		t.timestamps
  	end

  end
end
