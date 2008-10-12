require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/trucks/edit.html.erb" do
  include TrucksHelper
  
  before(:each) do
    assigns[:truck] = @truck = stub_model(Truck,
      :new_record? => false,
      :name => "value for name",
      :year => "1",
      :transmission => "1"
    )
  end

  it "should render edit form" do
    render "/trucks/edit.html.erb"
    
    response.should have_tag("form[action=#{truck_path(@truck)}][method=post]") do
      with_tag('input#truck_name[name=?]', "truck[name]")
      with_tag('input#truck_year[name=?]', "truck[year]")
      with_tag('input#truck_transmission[name=?]', "truck[transmission]")
    end
  end
end


