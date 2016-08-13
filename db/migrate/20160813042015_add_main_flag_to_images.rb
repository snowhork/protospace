class AddMainFlagToImages < ActiveRecord::Migration
  def change
    add_column :images, :main_flag, :boolean
  end
end
