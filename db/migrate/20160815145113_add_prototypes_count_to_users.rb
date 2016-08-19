class AddPrototypesCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :prototypes_count, :integer
  end
end
