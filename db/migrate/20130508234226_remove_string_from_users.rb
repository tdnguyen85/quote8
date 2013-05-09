class RemoveStringFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :string
  end

  def down
    add_column :users, :string, :string
  end
end
