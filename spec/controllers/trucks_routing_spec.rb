require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TrucksController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "trucks", :action => "index").should == "/trucks"
    end
  
    it "should map #new" do
      route_for(:controller => "trucks", :action => "new").should == "/trucks/new"
    end
  
    it "should map #show" do
      route_for(:controller => "trucks", :action => "show", :id => 1).should == "/trucks/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "trucks", :action => "edit", :id => 1).should == "/trucks/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "trucks", :action => "update", :id => 1).should == "/trucks/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "trucks", :action => "destroy", :id => 1).should == "/trucks/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/trucks").should == {:controller => "trucks", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/trucks/new").should == {:controller => "trucks", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/trucks").should == {:controller => "trucks", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/trucks/1").should == {:controller => "trucks", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/trucks/1/edit").should == {:controller => "trucks", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/trucks/1").should == {:controller => "trucks", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/trucks/1").should == {:controller => "trucks", :action => "destroy", :id => "1"}
    end
  end
end
