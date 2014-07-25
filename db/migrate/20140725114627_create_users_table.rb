class CreateUsersTable < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :name
  		t.string :password_digest
  		t.date :birthday
  		t.references :region
      t.string :email
  		
  		t.timestamps
  	end

  end
end
