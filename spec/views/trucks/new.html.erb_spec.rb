require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/trucks/new.html.erb" do
  include TrucksHelper
  
  before(:each) do
    assigns[:truck] = stub_model(Truck,
      :new_record? => true,
      :name => "value for name",
      :year => "1",
      :transmission => "1"
    )
  end

  it "should render new form" do
    render "/trucks/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", trucks_path) do
      with_tag("input#truck_name[name=?]", "truck[name]")
      with_tag("input#truck_year[name=?]", "truck[year]")
      with_tag("input#truck_transmission[name=?]", "truck[transmission]")
    end
  end
end


