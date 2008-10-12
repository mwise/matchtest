require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MatchableAttributesController do

  def mock_matchable_attribute(stubs={})
    @mock_matchable_attribute ||= mock_model(MatchableAttribute, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all matchable_attributes as @matchable_attributes" do
      MatchableAttribute.should_receive(:find).with(:all).and_return([mock_matchable_attribute])
      get :index
      assigns[:matchable_attributes].should == [mock_matchable_attribute]
    end

    describe "with mime type of xml" do
  
      it "should render all matchable_attributes as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        MatchableAttribute.should_receive(:find).with(:all).and_return(matchable_attributes = mock("Array of MatchableAttributes"))
        matchable_attributes.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested matchable_attribute as @matchable_attribute" do
      MatchableAttribute.should_receive(:find).with("37").and_return(mock_matchable_attribute)
      get :show, :id => "37"
      assigns[:matchable_attribute].should equal(mock_matchable_attribute)
    end
    
    describe "with mime type of xml" do

      it "should render the requested matchable_attribute as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        MatchableAttribute.should_receive(:find).with("37").and_return(mock_matchable_attribute)
        mock_matchable_attribute.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new matchable_attribute as @matchable_attribute" do
      MatchableAttribute.should_receive(:new).and_return(mock_matchable_attribute)
      get :new
      assigns[:matchable_attribute].should equal(mock_matchable_attribute)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested matchable_attribute as @matchable_attribute" do
      MatchableAttribute.should_receive(:find).with("37").and_return(mock_matchable_attribute)
      get :edit, :id => "37"
      assigns[:matchable_attribute].should equal(mock_matchable_attribute)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created matchable_attribute as @matchable_attribute" do
        MatchableAttribute.should_receive(:new).with({'these' => 'params'}).and_return(mock_matchable_attribute(:save => true))
        post :create, :matchable_attribute => {:these => 'params'}
        assigns(:matchable_attribute).should equal(mock_matchable_attribute)
      end

      it "should redirect to the created matchable_attribute" do
        MatchableAttribute.stub!(:new).and_return(mock_matchable_attribute(:save => true))
        post :create, :matchable_attribute => {}
        response.should redirect_to(matchable_attribute_url(mock_matchable_attribute))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved matchable_attribute as @matchable_attribute" do
        MatchableAttribute.stub!(:new).with({'these' => 'params'}).and_return(mock_matchable_attribute(:save => false))
        post :create, :matchable_attribute => {:these => 'params'}
        assigns(:matchable_attribute).should equal(mock_matchable_attribute)
      end

      it "should re-render the 'new' template" do
        MatchableAttribute.stub!(:new).and_return(mock_matchable_attribute(:save => false))
        post :create, :matchable_attribute => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested matchable_attribute" do
        MatchableAttribute.should_receive(:find).with("37").and_return(mock_matchable_attribute)
        mock_matchable_attribute.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :matchable_attribute => {:these => 'params'}
      end

      it "should expose the requested matchable_attribute as @matchable_attribute" do
        MatchableAttribute.stub!(:find).and_return(mock_matchable_attribute(:update_attributes => true))
        put :update, :id => "1"
        assigns(:matchable_attribute).should equal(mock_matchable_attribute)
      end

      it "should redirect to the matchable_attribute" do
        MatchableAttribute.stub!(:find).and_return(mock_matchable_attribute(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(matchable_attribute_url(mock_matchable_attribute))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested matchable_attribute" do
        MatchableAttribute.should_receive(:find).with("37").and_return(mock_matchable_attribute)
        mock_matchable_attribute.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :matchable_attribute => {:these => 'params'}
      end

      it "should expose the matchable_attribute as @matchable_attribute" do
        MatchableAttribute.stub!(:find).and_return(mock_matchable_attribute(:update_attributes => false))
        put :update, :id => "1"
        assigns(:matchable_attribute).should equal(mock_matchable_attribute)
      end

      it "should re-render the 'edit' template" do
        MatchableAttribute.stub!(:find).and_return(mock_matchable_attribute(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested matchable_attribute" do
      MatchableAttribute.should_receive(:find).with("37").and_return(mock_matchable_attribute)
      mock_matchable_attribute.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the matchable_attributes list" do
      MatchableAttribute.stub!(:find).and_return(mock_matchable_attribute(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(matchable_attributes_url)
    end

  end

end
