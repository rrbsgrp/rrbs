class CategorysalesController < ApplicationController
  # GET /categorysales
  # GET /categorysales.xml
  def index
    #@categorysales = Categorysale.all(:order => "date DESC")
    #@categorysales = Categorysale.order(:date).group(:date)
    @categorysale = Categorysale.all(:order => "date ASC")
    @categorysales = @categorysale.group_by { |cs| cs.date }
   
    respond_to do |format|
      @name = params[:branch]
      if params["commit"] == "Search"
       logger.info "User name: #{@name}"
       Categorysale.all(:order => "date ASC")
      else
      format.html # index.html.erb
      format.xml  { render :xml => @categorysales }
      end
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
    #fields = [:date,:cs_amount,:category_id]
    #data = [["08-07-2011",1,0],
    #        ["08-07-2011",2,1],
    #        ["08-07-2011",3,3]]
    #Categorysale.import fields, data

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
    @categorysale = Categorysale.new
    respond_to do |format|
        Categorysale.transaction do 
          Categorysale.create(:cs_amount =>params[:food],:category_id => 0, :date => params[:date],:vat =>params[:vat],:void =>params[:void],:servicecharge =>params[:servicecharge],:cs_revenue =>params[:cs_revenue],:transaction_count =>params[:transaction_count],:customer_count =>params[:customer_count]) 
          Categorysale.create(:cs_amount =>params[:liquor],:category_id => 1, :date => params[:date],:vat =>params[:vat],:void =>params[:void],:servicecharge =>params[:servicecharge],:cs_revenue =>params[:cs_revenue],:transaction_count =>params[:transaction_count],:customer_count =>params[:customer_count]) 
          Categorysale.create(:cs_amount =>params[:beverages],:category_id => 2, :date => params[:date],:vat =>params[:vat],:void =>params[:void],:servicecharge =>params[:servicecharge],:cs_revenue =>params[:cs_revenue],:transaction_count =>params[:transaction_count],:customer_count =>params[:customer_count]) 
        end 
        format.html { redirect_to(@categorysale, :notice => 'Categorysale was successfully created.') }
        #format.xml  { render :xml => @categorysale, :status => :created, :location => @categorysale }
      #else
        #format.html { render :action => "new" }
        #format.xml  { render :xml => @categorysale.errors, :status => :unprocessable_entity }
      #end
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
  
  def search
    @searchdate = params[:start]["date(1i)"] + "-" + params[:start]["date(2i)"] + "-" + params[:start]["date(3i)"]
    @categorysales = Categorysale.where("date = ?",@searchdate)
    
    respond_to do |format|
      format.html # search.html.erb
      format.xml
      #render :text => "OK"
    end
  end
end
