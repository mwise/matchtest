require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Truck do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :year => "1",
      :transmission => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Truck.create!(@valid_attributes)
  end
end
