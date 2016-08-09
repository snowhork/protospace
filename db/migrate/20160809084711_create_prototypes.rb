class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.text :catch_copy
      t.text :concept
      t.integer :user_id
      t.integer :comments_count
      t.integer :likes_count
      t.timestamps
    end
  end
end
