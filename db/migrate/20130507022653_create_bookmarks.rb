class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :url
      t.string :title
      t.text :quote
      t.date :retrieved_on
      t.date :published_on
      t.string :author_first_name
      t.string :author_last_name
      t.string :publisher
      t.string :string

      t.timestamps
    end
  end
end
