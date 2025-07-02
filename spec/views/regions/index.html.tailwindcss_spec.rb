require 'rails_helper'

RSpec.describe "regions/index", type: :view do
  before(:each) do
    assign(:regions, [
      Region.create!(
        name: "Name",
        display_name: "Display Name",
        alpha2_code_iso3166: "Alpha2 Code Iso3166",
        numeric_code_iso3166: "Numeric Code Iso3166",
        notes: nil
      ),
      Region.create!(
        name: "Name",
        display_name: "Display Name",
        alpha2_code_iso3166: "Alpha2 Code Iso3166",
        numeric_code_iso3166: "Numeric Code Iso3166",
        notes: nil
      )
    ])
  end

  it "renders a list of regions" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Display Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Alpha2 Code Iso3166".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Numeric Code Iso3166".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
