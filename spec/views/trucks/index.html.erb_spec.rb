require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/trucks/index.html.erb" do
  include TrucksHelper
  
  before(:each) do
    assigns[:trucks] = [
      stub_model(Truck,
        :name => "value for name",
        :year => "1",
        :transmission => "1"
      ),
      stub_model(Truck,
        :name => "value for name",
        :year => "1",
        :transmission => "1"
      )
    ]
  end

  it "should render list of trucks" do
    render "/trucks/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
  end
end

