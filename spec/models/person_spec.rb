require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Person do
  before(:each) do
    @valid_attributes = {
      :first_name => "value for first_name",
      :last_name => "value for last_name",
      :address_1 => "value for address_1",
      :address_2 => "value for address_2",
      :city => "value for city",
      :state => "value for state",
      :zip => "value for zip",
      :height => "1",
      :weight => "1",
      :age => "1"
    }
  end

  it "should create a new instance given valid attributes" do
    Person.create!(@valid_attributes)
  end
end
