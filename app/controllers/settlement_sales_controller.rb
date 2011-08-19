class SettlementSalesController < ApplicationController

  def index
    @settlement_sales = SettlementSale.all
    @settlement_types = SettlementType.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @settlement_sales }
    end
  end

  def show
    @settlement_sale = SettlementSale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @settlement_sale }
    end
  end

  def new
    @settlement_sale = SettlementSale.new
    @settlement_type = SettlementType.all
    count = SettlementType.all.count
    
    count.times { @settlement_sale.ssrows.build }
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @settlement_sale }
    end
  end

  def edit
    @settlement_sale = SettlementSale.find(params[:id])
  end

  def create
    @settlement_sale = SettlementSale.new(params[:settlement_sale])

    respond_to do |format|
      if @settlement_sale.save
        Categorysale.transaction do 
          Categorysale.create(:cs_amount =>params[:food],:category_id => 0, :date => params[:date],:vat =>params[:vat],:void =>params[:void],:servicecharge =>params[:servicecharge],:cs_revenue =>params[:cs_revenue],:transaction_count =>params[:transaction_count],:customer_count =>params[:customer_count]) 
          Categorysale.create(:cs_amount =>params[:liquor],:category_id => 1, :date => params[:date],:vat =>params[:vat],:void =>params[:void],:servicecharge =>params[:servicecharge],:cs_revenue =>params[:cs_revenue],:transaction_count =>params[:transaction_count],:customer_count =>params[:customer_count]) 
          Categorysale.create(:cs_amount =>params[:beverages],:category_id => 2, :date => params[:date],:vat =>params[:vat],:void =>params[:void],:servicecharge =>params[:servicecharge],:cs_revenue =>params[:cs_revenue],:transaction_count =>params[:transaction_count],:customer_count =>params[:customer_count]) 
        end
        format.html { redirect_to(@settlement_sale, :notice => 'Settlement sale was successfully created.') }
        format.xml  { render :xml => @settlement_sale, :status => :created, :location => @settlement_sale }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @settlement_sale.errors, :status => :unprocessable_entity }
      end
    end
  end

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

  def destroy
    @settlement_sale = SettlementSale.find(params[:id])
    @settlement_sale.destroy

    respond_to do |format|
      format.html { redirect_to(settlement_sales_url) }
      format.xml  { head :ok }
    end
  end
end
