require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MatchableAttributionsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "matchable_attributions", :action => "index").should == "/matchable_attributions"
    end
  
    it "should map #new" do
      route_for(:controller => "matchable_attributions", :action => "new").should == "/matchable_attributions/new"
    end
  
    it "should map #show" do
      route_for(:controller => "matchable_attributions", :action => "show", :id => 1).should == "/matchable_attributions/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "matchable_attributions", :action => "edit", :id => 1).should == "/matchable_attributions/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "matchable_attributions", :action => "update", :id => 1).should == "/matchable_attributions/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "matchable_attributions", :action => "destroy", :id => 1).should == "/matchable_attributions/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/matchable_attributions").should == {:controller => "matchable_attributions", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/matchable_attributions/new").should == {:controller => "matchable_attributions", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/matchable_attributions").should == {:controller => "matchable_attributions", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/matchable_attributions/1").should == {:controller => "matchable_attributions", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/matchable_attributions/1/edit").should == {:controller => "matchable_attributions", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/matchable_attributions/1").should == {:controller => "matchable_attributions", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/matchable_attributions/1").should == {:controller => "matchable_attributions", :action => "destroy", :id => "1"}
    end
  end
end
