class ApplicationController < ActionController::Base
  protect_from_forgery
  @all_bookmarks = Bookmark.count

end
