require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/matchable_attributes/show.html.erb" do
  include MatchableAttributesHelper
  
  before(:each) do
    assigns[:matchable_attribute] = @matchable_attribute = stub_model(MatchableAttribute,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "should render attributes in <p>" do
    render "/matchable_attributes/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
  end
end

