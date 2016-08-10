class AddTitleToPrototypes < ActiveRecord::Migration
  def change
    add_column :prototypes, :title, :string
  end
end
