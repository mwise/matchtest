require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/matchable_attributions/show.html.erb" do
  include MatchableAttributionsHelper
  
  before(:each) do
    assigns[:matchable_attribution] = @matchable_attribution = stub_model(MatchableAttribution,
      :value => "1"
    )
  end

  it "should render attributes in <p>" do
    render "/matchable_attributions/show.html.erb"
    response.should have_text(/1/)
  end
end

