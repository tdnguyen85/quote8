class Bookmark < ActiveRecord::Base
  attr_accessible :user_id, :user_name, :tag_list, :author_first_name, :author_last_name, :published_on, :publisher, :quote, :retrieved_on, :title, :url, :position
  belongs_to :user
  acts_as_taggable
  acts_as_list
end
