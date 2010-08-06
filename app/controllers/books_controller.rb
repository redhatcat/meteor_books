class BooksController < ApplicationController
  include MeteorCrud
  include NamedCellCrud

  def meteor_specs
    h = {}
    spec = meteor_spec
    h[spec.name] = spec
    h
  end

  def meteor_spec
    Meteor::NamedCellSpec.new do |spec|
      spec.klass = Book
      spec.controller_class = self.class
      spec.name = "book_details"
      spec.title = "Book Details"

      spec.rows.push(
        Meteor::NamedCellRow.new do |row|
          row.cell_list.push(
            Meteor::NamedCellColumn.new do |col|
              col.type = :scalar
              col.name = :title
              col.edit = true
              col.title = "Title"
            end
          )
          row.cell_list.push(
            Meteor::NamedCellColumn.new do |col|
              col.type = :scalar
              col.name = :isbn
              col.edit = true
              col.title = "ISBN"
            end
          )
          row.cell_list.push(
            Meteor::NamedCellColumn.new do |col|
              col.type = :date
              col.name = :publish_date
              col.edit = true
              col.title = "Date of publish"
            end
          )
        end
      )
    end
  end

  # GET /books
  # GET /books.xml
  def index
    @books = Book.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @books }
    end
  end

  # GET /books/1
  # GET /books/1.xml
  def show
    renderer = Meteor::NamedCellRenderer.new(
      :spec => meteor_spec,
      :controller => self,
		  :frontend => "named_cell",
      :params => params,
	    :id => params[:id]
    )
    render :inline => renderer.render, :layout => true
  end

  # GET /books/new
  # GET /books/new.xml
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.xml
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        flash[:notice] = 'Book was successfully created.'
        format.html { redirect_to(@book) }
        format.xml  { render :xml => @book, :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        flash[:notice] = 'Book was successfully updated.'
        format.html { redirect_to(@book) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to(books_url) }
      format.xml  { head :ok }
    end
  end
end
