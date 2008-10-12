require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/people/edit.html.erb" do
  include PeopleHelper
  
  before(:each) do
    assigns[:person] = @person = stub_model(Person,
      :new_record? => false,
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
    )
  end

  it "should render edit form" do
    render "/people/edit.html.erb"
    
    response.should have_tag("form[action=#{person_path(@person)}][method=post]") do
      with_tag('input#person_first_name[name=?]', "person[first_name]")
      with_tag('input#person_last_name[name=?]', "person[last_name]")
      with_tag('input#person_address_1[name=?]', "person[address_1]")
      with_tag('input#person_address_2[name=?]', "person[address_2]")
      with_tag('input#person_city[name=?]', "person[city]")
      with_tag('input#person_state[name=?]', "person[state]")
      with_tag('input#person_zip[name=?]', "person[zip]")
      with_tag('input#person_height[name=?]', "person[height]")
      with_tag('input#person_weight[name=?]', "person[weight]")
      with_tag('input#person_age[name=?]', "person[age]")
    end
  end
end


