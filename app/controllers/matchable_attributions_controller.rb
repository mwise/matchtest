class MatchableAttributionsController < ApplicationController
  # GET /matchable_attributions
  # GET /matchable_attributions.xml
  def index
    @matchable_attributions = MatchableAttribution.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @matchable_attributions }
    end
  end

  # GET /matchable_attributions/1
  # GET /matchable_attributions/1.xml
  def show
    @matchable_attribution = MatchableAttribution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @matchable_attribution }
    end
  end

  # GET /matchable_attributions/new
  # GET /matchable_attributions/new.xml
  def new
    @matchable_attribution = MatchableAttribution.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @matchable_attribution }
    end
  end

  # GET /matchable_attributions/1/edit
  def edit
    @matchable_attribution = MatchableAttribution.find(params[:id])
  end

  # POST /matchable_attributions
  # POST /matchable_attributions.xml
  def create
    @matchable_attribution = MatchableAttribution.new(params[:matchable_attribution])

    respond_to do |format|
      if @matchable_attribution.save
        flash[:notice] = 'MatchableAttribution was successfully created.'
        format.html { redirect_to(@matchable_attribution) }
        format.xml  { render :xml => @matchable_attribution, :status => :created, :location => @matchable_attribution }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @matchable_attribution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /matchable_attributions/1
  # PUT /matchable_attributions/1.xml
  def update
    @matchable_attribution = MatchableAttribution.find(params[:id])

    respond_to do |format|
      if @matchable_attribution.update_attributes(params[:matchable_attribution])
        flash[:notice] = 'MatchableAttribution was successfully updated.'
        format.html { redirect_to(@matchable_attribution) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @matchable_attribution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /matchable_attributions/1
  # DELETE /matchable_attributions/1.xml
  def destroy
    @matchable_attribution = MatchableAttribution.find(params[:id])
    @matchable_attribution.destroy

    respond_to do |format|
      format.html { redirect_to(matchable_attributions_url) }
      format.xml  { head :ok }
    end
  end
end
