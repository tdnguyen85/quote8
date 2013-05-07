require 'test_helper'

class BookmarksControllerTest < ActionController::TestCase
  setup do
    @bookmark = bookmarks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bookmarks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bookmark" do
    assert_difference('Bookmark.count') do
      post :create, bookmark: { author_first_name: @bookmark.author_first_name, author_last_name: @bookmark.author_last_name, published_on: @bookmark.published_on, publisher: @bookmark.publisher, quote: @bookmark.quote, retrieved_on: @bookmark.retrieved_on, string: @bookmark.string, title: @bookmark.title, url: @bookmark.url }
    end

    assert_redirected_to bookmark_path(assigns(:bookmark))
  end

  test "should show bookmark" do
    get :show, id: @bookmark
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bookmark
    assert_response :success
  end

  test "should update bookmark" do
    put :update, id: @bookmark, bookmark: { author_first_name: @bookmark.author_first_name, author_last_name: @bookmark.author_last_name, published_on: @bookmark.published_on, publisher: @bookmark.publisher, quote: @bookmark.quote, retrieved_on: @bookmark.retrieved_on, string: @bookmark.string, title: @bookmark.title, url: @bookmark.url }
    assert_redirected_to bookmark_path(assigns(:bookmark))
  end

  test "should destroy bookmark" do
    assert_difference('Bookmark.count', -1) do
      delete :destroy, id: @bookmark
    end

    assert_redirected_to bookmarks_path
  end
end
