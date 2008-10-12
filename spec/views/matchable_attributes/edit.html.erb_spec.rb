require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/matchable_attributes/edit.html.erb" do
  include MatchableAttributesHelper
  
  before(:each) do
    assigns[:matchable_attribute] = @matchable_attribute = stub_model(MatchableAttribute,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "should render edit form" do
    render "/matchable_attributes/edit.html.erb"
    
    response.should have_tag("form[action=#{matchable_attribute_path(@matchable_attribute)}][method=post]") do
      with_tag('input#matchable_attribute_name[name=?]', "matchable_attribute[name]")
      with_tag('textarea#matchable_attribute_description[name=?]', "matchable_attribute[description]")
    end
  end
end


