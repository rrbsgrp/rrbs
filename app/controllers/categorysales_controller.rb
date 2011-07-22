class CategorysalesController < ApplicationController
  # GET /categorysales
  # GET /categorysales.xml
  def index
    @categorysales = Categorysale.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categorysales }
    end
  end

  # GET /categorysales/1
  # GET /categorysales/1.xml
  def show
    @categorysale = Categorysale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @categorysale }
    end
  end

  # GET /categorysales/new
  # GET /categorysales/new.xml
  def new
    @categorysale = Categorysale.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @categorysale }
    end
  end

  # GET /categorysales/1/edit
  def edit
    @categorysale = Categorysale.find(params[:id])
  end

  # POST /categorysales
  # POST /categorysales.xml
  def create
    @categorysale = Categorysale.new(params[:categorysale])

    respond_to do |format|
      if @categorysale.save
        format.html { redirect_to(@categorysale, :notice => 'Categorysale was successfully created.') }
        format.xml  { render :xml => @categorysale, :status => :created, :location => @categorysale }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @categorysale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categorysales/1
  # PUT /categorysales/1.xml
  def update
    @categorysale = Categorysale.find(params[:id])

    respond_to do |format|
      if @categorysale.update_attributes(params[:categorysale])
        format.html { redirect_to(@categorysale, :notice => 'Categorysale was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @categorysale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categorysales/1
  # DELETE /categorysales/1.xml
  def destroy
    @categorysale = Categorysale.find(params[:id])
    @categorysale.destroy

    respond_to do |format|
      format.html { redirect_to(categorysales_url) }
      format.xml  { head :ok }
    end
  end
end
