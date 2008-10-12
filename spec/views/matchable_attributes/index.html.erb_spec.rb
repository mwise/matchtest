require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/matchable_attributes/index.html.erb" do
  include MatchableAttributesHelper
  
  before(:each) do
    assigns[:matchable_attributes] = [
      stub_model(MatchableAttribute,
        :name => "value for name",
        :description => "value for description"
      ),
      stub_model(MatchableAttribute,
        :name => "value for name",
        :description => "value for description"
      )
    ]
  end

  it "should render list of matchable_attributes" do
    render "/matchable_attributes/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for description", 2)
  end
end

