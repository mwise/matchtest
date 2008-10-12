require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/matchable_attributions/new.html.erb" do
  include MatchableAttributionsHelper
  
  before(:each) do
    assigns[:matchable_attribution] = stub_model(MatchableAttribution,
      :new_record? => true,
      :value => "1"
    )
  end

  it "should render new form" do
    render "/matchable_attributions/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", matchable_attributions_path) do
      with_tag("input#matchable_attribution_value[name=?]", "matchable_attribution[value]")
    end
  end
end


