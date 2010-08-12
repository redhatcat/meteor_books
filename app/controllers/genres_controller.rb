class GenresController < ApplicationController
  include Meteor::Crud::Meteor
  include Meteor::Crud::NamedCell

  def meteor_specs
    specs = []
    specs << Meteor::Widget::NamedCell::Spec.new do |spec|
      spec.klass = Genre
      spec.controller_class = self.class
      spec.name = "details"
      spec.title = "Details"

      spec.rows.push(
        Meteor::Widget::NamedCell::Row.new do |row|
          row.cell_list.push(
            Meteor::Widget::NamedCell::Column.new do |col|
              col.type = :scalar
              col.name = :name
              col.edit = true
              col.title = "Name"
            end
          )
        end
      )
    end
    specs << Meteor::Widget::Meteor::Spec.new do |spec|
      spec.klass = Book
      spec.parent_klass = Genre
      spec.controller_class = self.class
      spec.title = "Books"
      spec.name = 'books'
      spec.columns.push(
        Meteor::Widget::Meteor::Column.new{ |c|
          c.name = "title"
          c.type = :scalar
          c.edit = true
          c.create = true
        }
      )
      spec.columns.push(
        Meteor::Widget::Meteor::Column.new{ |c|
          c.name = "isbn"
          c.type = :scalar
          c.edit = true
          c.create = true
        }
      )
      spec.columns.push(
        Meteor::Widget::Meteor::Column.new { |c|
          c.name = :publish_date
          c.type = :scalar
          c.edit = true
          c.create = true
        }
      )
    end

    h = {}
    specs.each do |spec|
      h[spec.name] = spec
    end
    h
  end

  def meteor_spec(h={})
    meteor_specs[h[:name].downcase]
  end

  # GET /genres
  # GET /genres.xml
  def index
    @genres = Genre.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @genres }
    end
  end

  # GET /genres/1
  # GET /genres/1.xml
  def show
    renderers = []
    renderers << Meteor::Widget::NamedCell::Renderer.new(
      :spec => meteor_spec(:name => 'details'),
      :controller => self,
      :frontend => "named_cell",
      :params => params,
      :id => params[:id]
    )
    renderers << Meteor::Widget::Meteor::Renderer.new(
      :spec => meteor_spec(:name => 'books'),
      :controller => self,
      :frontend => "meteor",
      :params => params,
      :id => params[:id]
    )
    render :inline => renderers.collect{ |r| r.render }.join, :layout => true
  end

  # GET /genres/new
  # GET /genres/new.xml
  def new
    @genre = Genre.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @genre }
    end
  end

  # GET /genres/1/edit
  def edit
    @genre = Genre.find(params[:id])
  end

  # POST /genres
  # POST /genres.xml
  def create
    @genre = Genre.new(params[:genre])

    respond_to do |format|
      if @genre.save
        flash[:notice] = 'Genre was successfully created.'
        format.html { redirect_to(@genre) }
        format.xml  { render :xml => @genre, :status => :created, :location => @genre }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @genre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /genres/1
  # PUT /genres/1.xml
  def update
    @genre = Genre.find(params[:id])

    respond_to do |format|
      if @genre.update_attributes(params[:genre])
        flash[:notice] = 'Genre was successfully updated.'
        format.html { redirect_to(@genre) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @genre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /genres/1
  # DELETE /genres/1.xml
  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy

    respond_to do |format|
      format.html { redirect_to(genres_url) }
      format.xml  { head :ok }
    end
  end
end
