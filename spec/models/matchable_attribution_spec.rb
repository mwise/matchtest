require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MatchableAttribution do
  before(:each) do
    @valid_attributes = {
      :matchable_id => "1",
      :matchable_attribute_id => "1",
      :value => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    MatchableAttribution.create!(@valid_attributes)
  end
end
