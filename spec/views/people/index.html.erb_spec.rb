require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/people/index.html.erb" do
  include PeopleHelper
  
  before(:each) do
    assigns[:people] = [
      stub_model(Person,
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
      ),
      stub_model(Person,
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
    ]
  end

  it "should render list of people" do
    render "/people/index.html.erb"
    response.should have_tag("tr>td", "value for first_name", 2)
    response.should have_tag("tr>td", "value for last_name", 2)
    response.should have_tag("tr>td", "value for address_1", 2)
    response.should have_tag("tr>td", "value for address_2", 2)
    response.should have_tag("tr>td", "value for city", 2)
    response.should have_tag("tr>td", "value for state", 2)
    response.should have_tag("tr>td", "value for zip", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
  end
end

