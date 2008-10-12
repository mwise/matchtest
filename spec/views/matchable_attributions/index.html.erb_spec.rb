require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/matchable_attributions/index.html.erb" do
  include MatchableAttributionsHelper
  
  before(:each) do
    assigns[:matchable_attributions] = [
      stub_model(MatchableAttribution,
        :value => "1"
      ),
      stub_model(MatchableAttribution,
        :value => "1"
      )
    ]
  end

  it "should render list of matchable_attributions" do
    render "/matchable_attributions/index.html.erb"
    response.should have_tag("tr>td", "1", 2)
  end
end

