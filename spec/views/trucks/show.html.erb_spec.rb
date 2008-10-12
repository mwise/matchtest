require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/trucks/show.html.erb" do
  include TrucksHelper
  
  before(:each) do
    assigns[:truck] = @truck = stub_model(Truck,
      :name => "value for name",
      :year => "1",
      :transmission => "1"
    )
  end

  it "should render attributes in <p>" do
    render "/trucks/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

