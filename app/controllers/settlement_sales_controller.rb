class SettlementSalesController < ApplicationController
  # GET /settlement_sales
  # GET /settlement_sales.xml
  def index
    @settlement_sales = SettlementSale.all
    @settlement_types = SettlementType.all 
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @settlement_sales }
    end
  end

  # GET /settlement_sales/1
  # GET /settlement_sales/1.xml
  def show
    @settlement_sale = SettlementSale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @settlement_sale }
    end
  end

  # GET /settlement_sales/new
  # GET /settlement_sales/new.xml
  def new
    @settlement_sale = SettlementSale.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @settlement_sale }
    end
  end

  # GET /settlement_sales/1/edit
  def edit
    @settlement_sale = SettlementSale.find(params[:id])
  end

  # POST /settlement_sales
  # POST /settlement_sales.xml
  def create
    @settlement_sale = SettlementSale.new(params[:settlement_sale])

    respond_to do |format|
      if @settlement_sale.save
        format.html { redirect_to(@settlement_sale, :notice => 'Settlement sale was successfully created.') }
        format.xml  { render :xml => @settlement_sale, :status => :created, :location => @settlement_sale }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @settlement_sale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /settlement_sales/1
  # PUT /settlement_sales/1.xml
  def update
    @settlement_sale = SettlementSale.find(params[:id])

    respond_to do |format|
      if @settlement_sale.update_attributes(params[:settlement_sale])
        format.html { redirect_to(@settlement_sale, :notice => 'Settlement sale was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @settlement_sale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /settlement_sales/1
  # DELETE /settlement_sales/1.xml
  def destroy
    @settlement_sale = SettlementSale.find(params[:id])
    @settlement_sale.destroy

    respond_to do |format|
      format.html { redirect_to(settlement_sales_url) }
      format.xml  { head :ok }
    end
  end
end
