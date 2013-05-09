class BookmarksController < ApplicationController
  # GET /bookmarks
  # GET /bookmarks.json
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    if params[:tag]
      @bookmarks = Bookmark.tagged_with(params[:tag])
    else
      @bookmarks = Bookmark.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bookmarks }
    end
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show

    @bookmark = Bookmark.find(params[:id])

    if params[:bookmarklet]
      render 'show_window'
      return
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bookmark }
    end
  end

  # def show_window
  #   @bookmark = Bookmark.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @bookmark }
  #   end
  # end


  # GET /bookmarks/new
  # GET /bookmarks/new.json
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

  # def new_window
  #   @bookmark = Bookmark.new :url => params[:url], :title => params[:title], :quote => params[:text]
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @bookmark }
  #   end
  # end

  # GET /bookmarks/1/edit
  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @bookmark = Bookmark.new(params[:bookmark])

    if params[:bookmarklet]
      @bookmark.save
      render 'show_window'
      @bookmark.save
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

  # PUT /bookmarks/1
  # PUT /bookmarks/1.json
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

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
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
      Faq.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
end
