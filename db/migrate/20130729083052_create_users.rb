class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
	    t.string   "email",                  :null => false
    	t.string   "encrypted_password",     :null => false
    	t.string   "solt",     				 :null => false
   	    t.string   "name"
	    t.string   "phone"
    	t.string   "addr"
	    t.timestamps
    end
  end
end
