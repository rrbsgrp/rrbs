class PurchaseItemsController < ApplicationController
  # GET /purchase_items
  # GET /purchase_items.xml
  def index
    @purchase_items = PurchaseItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @purchase_items }
    end
  end

  # GET /purchase_items/1
  # GET /purchase_items/1.xml
  def show
    @purchase_item = PurchaseItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchase_item }
    end
  end

  # GET /purchase_items/new
  # GET /purchase_items/new.xml
  def new
    @purchase_item = PurchaseItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchase_item }
    end
  end

  # GET /purchase_items/1/edit
  def edit
    @purchase_item = PurchaseItem.find(params[:id])
  end

  # POST /purchase_items
  # POST /purchase_items.xml
  def create
    @purchase_item = PurchaseItem.new(params[:purchase_item])

    respond_to do |format|
      if @purchase_item.save
        format.html { redirect_to(@purchase_item, :notice => 'Purchase item was successfully created.') }
        format.xml  { render :xml => @purchase_item, :status => :created, :location => @purchase_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purchase_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /purchase_items/1
  # PUT /purchase_items/1.xml
  def update
    @purchase_item = PurchaseItem.find(params[:id])

    respond_to do |format|
      if @purchase_item.update_attributes(params[:purchase_item])
        format.html { redirect_to(@purchase_item, :notice => 'Purchase item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purchase_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_items/1
  # DELETE /purchase_items/1.xml
  def destroy
    @purchase_item = PurchaseItem.find(params[:id])
    @purchase_item.destroy

    respond_to do |format|
      format.html { redirect_to(purchase_items_url) }
      format.xml  { head :ok }
    end
  end
end
