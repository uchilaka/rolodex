require 'rails_helper'

RSpec.describe "regions/edit", type: :view do
  let(:region) {
    Region.create!(
      name: "MyString",
      display_name: "MyString",
      alpha2_code_iso3166: "MyString",
      numeric_code_iso3166: "MyString"
    )
  }

  before(:each) do
    assign(:region, region)
  end

  it "renders the edit region form" do
    render

    assert_select "form[action=?][method=?]", region_path(region), "post" do

      assert_select "input[name=?]", "region[name]"

      assert_select "input[name=?]", "region[display_name]"

      assert_select "input[name=?]", "region[alpha2_code_iso3166]"

      assert_select "input[name=?]", "region[numeric_code_iso3166]"
    end
  end
end
