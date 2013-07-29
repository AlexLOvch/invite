class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :email, :null=>false
      t.string :link, :null=>false
      t.timestamps
    end
    add_index :invitations, :email
    add_index :invitations, :link
  end
end
