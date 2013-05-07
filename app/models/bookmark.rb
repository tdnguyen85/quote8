class Bookmark < ActiveRecord::Base
  attr_accessible :tag_list, :author_first_name, :author_last_name, :published_on, :publisher, :quote, :retrieved_on, :string, :title, :url
  belongs_to :user
  acts_as_taggable

end
