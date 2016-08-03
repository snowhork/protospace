class AddDetailColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :works, :text
    add_column :users, :profile, :text
    add_column :users, :member, :text
  end
end
