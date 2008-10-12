require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MatchableAttributesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "matchable_attributes", :action => "index").should == "/matchable_attributes"
    end
  
    it "should map #new" do
      route_for(:controller => "matchable_attributes", :action => "new").should == "/matchable_attributes/new"
    end
  
    it "should map #show" do
      route_for(:controller => "matchable_attributes", :action => "show", :id => 1).should == "/matchable_attributes/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "matchable_attributes", :action => "edit", :id => 1).should == "/matchable_attributes/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "matchable_attributes", :action => "update", :id => 1).should == "/matchable_attributes/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "matchable_attributes", :action => "destroy", :id => 1).should == "/matchable_attributes/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/matchable_attributes").should == {:controller => "matchable_attributes", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/matchable_attributes/new").should == {:controller => "matchable_attributes", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/matchable_attributes").should == {:controller => "matchable_attributes", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/matchable_attributes/1").should == {:controller => "matchable_attributes", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/matchable_attributes/1/edit").should == {:controller => "matchable_attributes", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/matchable_attributes/1").should == {:controller => "matchable_attributes", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/matchable_attributes/1").should == {:controller => "matchable_attributes", :action => "destroy", :id => "1"}
    end
  end
end
