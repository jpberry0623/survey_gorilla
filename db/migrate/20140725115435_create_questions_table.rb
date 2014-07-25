class CreateQuestionsTable < ActiveRecord::Migration
  def change
  	create_table :questions do |t|
  		t.references :question_type_id
  		t.references :survey_id
  		t.string :prompt
  		
  		t.timestamps
  	end

  end
end
