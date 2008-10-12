require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/matchable_attributes/new.html.erb" do
  include MatchableAttributesHelper
  
  before(:each) do
    assigns[:matchable_attribute] = stub_model(MatchableAttribute,
      :new_record? => true,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "should render new form" do
    render "/matchable_attributes/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", matchable_attributes_path) do
      with_tag("input#matchable_attribute_name[name=?]", "matchable_attribute[name]")
      with_tag("textarea#matchable_attribute_description[name=?]", "matchable_attribute[description]")
    end
  end
end


