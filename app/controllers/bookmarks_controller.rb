class BookmarksController < ApplicationController
  # GET /bookmarks
  # GET /bookmarks.json
  before_filter :authenticate_user!, except: [:index, :show]


  def search
    if params[:query]
      q = params[:query]
      @bookmarks = current_user.bookmarks.where(["quote LIKE ? OR title LIKE ?", "%#{q}%", "%#{q}%"])
        render 'index'
    else
      @bookmarks = current_user.bookmarks.order('position').reverse
        render 'index'
    end
  end




  def index
    @current_user_tags = Array.new

    if current_user
      current_user.bookmarks.each do |item|
        item.tag_list.each do |tag|
          @current_user_tags << tag
        end
      end
    end

    @uniq_tag_list = @current_user_tags.uniq

    if params[:tag]
      @bookmark_count = current_user.bookmarks.tagged_with(params[:tag]).count
      @particular_tag = "tagged as " + params[:tag]
      @bookmarks = current_user.bookmarks.tagged_with(params[:tag]).order('position').reverse

    else
      @bookmark_count = current_user.bookmarks.count
      @bookmarks = current_user.bookmarks.order('position').reverse
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bookmarks }
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    @form_regex = "[a-zA-Z]"
    @user_tags = current_user.bookmarks
    if current_user != @bookmark.user
      render 'no_access'
      return
    end

    if params[:bookmarklet]
      render 'show_window'
      return
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bookmark }
    end
  end

  def new
    @bookmark = Bookmark.new :url => params[:url], :title => params[:title], :quote => params[:text]

    if params[:bookmarklet]
      @bookmark = Bookmark.new :url => params[:url], :title => params[:title], :quote => params[:text]
      render 'new_window'
      return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bookmark }
    end
  end


  def edit
    @bookmark = Bookmark.find(params[:id])
  end


  def create
    @bookmark = Bookmark.new(params[:bookmark])
    # :user_id, :value => current_user.id
    @bookmark.user = current_user

    if params[:bookmarklet]
      @bookmark.save
      render 'show_window'
      return
    end

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully created.' }
        format.json { render json: @bookmark, status: :created, location: @bookmark }
      else
        format.html { render action: "new" }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @bookmark = Bookmark.find(params[:id])

    respond_to do |format|
      if @bookmark.update_attributes(params[:bookmark])
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    respond_to do |format|
      format.html { redirect_to bookmarks_url }
      format.json { head :no_content }
    end
  end

  def sort
    params[:bookmark].each_with_index do |id, index|
      Bookmark.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

  def send_email
    @to = params[:to]
    @id = params[:id]
    @bookmark = Bookmark.find(@id)
    Exportdata.form_email(@to,@id).deliver
  end

end
