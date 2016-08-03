class AddMemberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :member, :text
  end
end
