class ChangeTextToComments < ActiveRecord::Migration
  def change
    change_column_null :comments, :text, false
  end
end
