require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/people/show.html.erb" do
  include PeopleHelper
  
  before(:each) do
    assigns[:person] = @person = stub_model(Person,
      :first_name => "value for first_name",
      :last_name => "value for last_name",
      :address_1 => "value for address_1",
      :address_2 => "value for address_2",
      :city => "value for city",
      :state => "value for state",
      :zip => "value for zip",
      :height => "1",
      :weight => "1",
      :age => "1"
    )
  end

  it "should render attributes in <p>" do
    render "/people/show.html.erb"
    response.should have_text(/value\ for\ first_name/)
    response.should have_text(/value\ for\ last_name/)
    response.should have_text(/value\ for\ address_1/)
    response.should have_text(/value\ for\ address_2/)
    response.should have_text(/value\ for\ city/)
    response.should have_text(/value\ for\ state/)
    response.should have_text(/value\ for\ zip/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

