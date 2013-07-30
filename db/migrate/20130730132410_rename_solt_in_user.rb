class RenameSoltInUser < ActiveRecord::Migration
  def change
    rename_column :users, :solt, :salt
  end
end
