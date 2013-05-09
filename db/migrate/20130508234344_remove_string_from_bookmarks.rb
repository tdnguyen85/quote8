class RemoveStringFromBookmarks < ActiveRecord::Migration
  def up
    remove_column :bookmarks, :string
  end

  def down
    add_column :bookmarks, :string, :string
  end
end
