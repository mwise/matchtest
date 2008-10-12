require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/matchable_attributions/edit.html.erb" do
  include MatchableAttributionsHelper
  
  before(:each) do
    assigns[:matchable_attribution] = @matchable_attribution = stub_model(MatchableAttribution,
      :new_record? => false,
      :value => "1"
    )
  end

  it "should render edit form" do
    render "/matchable_attributions/edit.html.erb"
    
    response.should have_tag("form[action=#{matchable_attribution_path(@matchable_attribution)}][method=post]") do
      with_tag('input#matchable_attribution_value[name=?]', "matchable_attribution[value]")
    end
  end
end


