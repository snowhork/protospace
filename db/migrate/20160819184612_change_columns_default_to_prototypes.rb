class ChangeColumnsDefaultToPrototypes < ActiveRecord::Migration
  def change
    change_column_default :prototypes, :comments_count, 0
    change_column_default :prototypes, :likes_count, 0
  end
end
