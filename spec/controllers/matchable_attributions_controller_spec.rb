require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MatchableAttributionsController do

  def mock_matchable_attribution(stubs={})
    @mock_matchable_attribution ||= mock_model(MatchableAttribution, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all matchable_attributions as @matchable_attributions" do
      MatchableAttribution.should_receive(:find).with(:all).and_return([mock_matchable_attribution])
      get :index
      assigns[:matchable_attributions].should == [mock_matchable_attribution]
    end

    describe "with mime type of xml" do
  
      it "should render all matchable_attributions as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        MatchableAttribution.should_receive(:find).with(:all).and_return(matchable_attributions = mock("Array of MatchableAttributions"))
        matchable_attributions.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested matchable_attribution as @matchable_attribution" do
      MatchableAttribution.should_receive(:find).with("37").and_return(mock_matchable_attribution)
      get :show, :id => "37"
      assigns[:matchable_attribution].should equal(mock_matchable_attribution)
    end
    
    describe "with mime type of xml" do

      it "should render the requested matchable_attribution as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        MatchableAttribution.should_receive(:find).with("37").and_return(mock_matchable_attribution)
        mock_matchable_attribution.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new matchable_attribution as @matchable_attribution" do
      MatchableAttribution.should_receive(:new).and_return(mock_matchable_attribution)
      get :new
      assigns[:matchable_attribution].should equal(mock_matchable_attribution)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested matchable_attribution as @matchable_attribution" do
      MatchableAttribution.should_receive(:find).with("37").and_return(mock_matchable_attribution)
      get :edit, :id => "37"
      assigns[:matchable_attribution].should equal(mock_matchable_attribution)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created matchable_attribution as @matchable_attribution" do
        MatchableAttribution.should_receive(:new).with({'these' => 'params'}).and_return(mock_matchable_attribution(:save => true))
        post :create, :matchable_attribution => {:these => 'params'}
        assigns(:matchable_attribution).should equal(mock_matchable_attribution)
      end

      it "should redirect to the created matchable_attribution" do
        MatchableAttribution.stub!(:new).and_return(mock_matchable_attribution(:save => true))
        post :create, :matchable_attribution => {}
        response.should redirect_to(matchable_attribution_url(mock_matchable_attribution))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved matchable_attribution as @matchable_attribution" do
        MatchableAttribution.stub!(:new).with({'these' => 'params'}).and_return(mock_matchable_attribution(:save => false))
        post :create, :matchable_attribution => {:these => 'params'}
        assigns(:matchable_attribution).should equal(mock_matchable_attribution)
      end

      it "should re-render the 'new' template" do
        MatchableAttribution.stub!(:new).and_return(mock_matchable_attribution(:save => false))
        post :create, :matchable_attribution => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested matchable_attribution" do
        MatchableAttribution.should_receive(:find).with("37").and_return(mock_matchable_attribution)
        mock_matchable_attribution.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :matchable_attribution => {:these => 'params'}
      end

      it "should expose the requested matchable_attribution as @matchable_attribution" do
        MatchableAttribution.stub!(:find).and_return(mock_matchable_attribution(:update_attributes => true))
        put :update, :id => "1"
        assigns(:matchable_attribution).should equal(mock_matchable_attribution)
      end

      it "should redirect to the matchable_attribution" do
        MatchableAttribution.stub!(:find).and_return(mock_matchable_attribution(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(matchable_attribution_url(mock_matchable_attribution))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested matchable_attribution" do
        MatchableAttribution.should_receive(:find).with("37").and_return(mock_matchable_attribution)
        mock_matchable_attribution.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :matchable_attribution => {:these => 'params'}
      end

      it "should expose the matchable_attribution as @matchable_attribution" do
        MatchableAttribution.stub!(:find).and_return(mock_matchable_attribution(:update_attributes => false))
        put :update, :id => "1"
        assigns(:matchable_attribution).should equal(mock_matchable_attribution)
      end

      it "should re-render the 'edit' template" do
        MatchableAttribution.stub!(:find).and_return(mock_matchable_attribution(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested matchable_attribution" do
      MatchableAttribution.should_receive(:find).with("37").and_return(mock_matchable_attribution)
      mock_matchable_attribution.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the matchable_attributions list" do
      MatchableAttribution.stub!(:find).and_return(mock_matchable_attribution(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(matchable_attributions_url)
    end

  end

end
