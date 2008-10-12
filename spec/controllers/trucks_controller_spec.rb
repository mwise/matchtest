require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TrucksController do

  def mock_truck(stubs={})
    @mock_truck ||= mock_model(Truck, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all trucks as @trucks" do
      Truck.should_receive(:find).with(:all).and_return([mock_truck])
      get :index
      assigns[:trucks].should == [mock_truck]
    end

    describe "with mime type of xml" do
  
      it "should render all trucks as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Truck.should_receive(:find).with(:all).and_return(trucks = mock("Array of Trucks"))
        trucks.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested truck as @truck" do
      Truck.should_receive(:find).with("37").and_return(mock_truck)
      get :show, :id => "37"
      assigns[:truck].should equal(mock_truck)
    end
    
    describe "with mime type of xml" do

      it "should render the requested truck as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Truck.should_receive(:find).with("37").and_return(mock_truck)
        mock_truck.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new truck as @truck" do
      Truck.should_receive(:new).and_return(mock_truck)
      get :new
      assigns[:truck].should equal(mock_truck)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested truck as @truck" do
      Truck.should_receive(:find).with("37").and_return(mock_truck)
      get :edit, :id => "37"
      assigns[:truck].should equal(mock_truck)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created truck as @truck" do
        Truck.should_receive(:new).with({'these' => 'params'}).and_return(mock_truck(:save => true))
        post :create, :truck => {:these => 'params'}
        assigns(:truck).should equal(mock_truck)
      end

      it "should redirect to the created truck" do
        Truck.stub!(:new).and_return(mock_truck(:save => true))
        post :create, :truck => {}
        response.should redirect_to(truck_url(mock_truck))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved truck as @truck" do
        Truck.stub!(:new).with({'these' => 'params'}).and_return(mock_truck(:save => false))
        post :create, :truck => {:these => 'params'}
        assigns(:truck).should equal(mock_truck)
      end

      it "should re-render the 'new' template" do
        Truck.stub!(:new).and_return(mock_truck(:save => false))
        post :create, :truck => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested truck" do
        Truck.should_receive(:find).with("37").and_return(mock_truck)
        mock_truck.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :truck => {:these => 'params'}
      end

      it "should expose the requested truck as @truck" do
        Truck.stub!(:find).and_return(mock_truck(:update_attributes => true))
        put :update, :id => "1"
        assigns(:truck).should equal(mock_truck)
      end

      it "should redirect to the truck" do
        Truck.stub!(:find).and_return(mock_truck(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(truck_url(mock_truck))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested truck" do
        Truck.should_receive(:find).with("37").and_return(mock_truck)
        mock_truck.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :truck => {:these => 'params'}
      end

      it "should expose the truck as @truck" do
        Truck.stub!(:find).and_return(mock_truck(:update_attributes => false))
        put :update, :id => "1"
        assigns(:truck).should equal(mock_truck)
      end

      it "should re-render the 'edit' template" do
        Truck.stub!(:find).and_return(mock_truck(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested truck" do
      Truck.should_receive(:find).with("37").and_return(mock_truck)
      mock_truck.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the trucks list" do
      Truck.stub!(:find).and_return(mock_truck(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(trucks_url)
    end

  end

end
