require 'rails_helper'

RSpec.describe "regions/new", type: :view do
  before(:each) do
    assign(:region, Region.new(
      name: "MyString",
      display_name: "MyString",
      alpha2_code_iso3166: "MyString",
      numeric_code_iso3166: "MyString"
    ))
  end

  it "renders new region form" do
    render

    assert_select "form[action=?][method=?]", regions_path, "post" do

      assert_select "input[name=?]", "region[name]"

      assert_select "input[name=?]", "region[display_name]"

      assert_select "input[name=?]", "region[alpha2_code_iso3166]"

      assert_select "input[name=?]", "region[numeric_code_iso3166]"
    end
  end
end
