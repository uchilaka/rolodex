require 'rails_helper'

RSpec.describe "regions/show", type: :view do
  before(:each) do
    assign(:region, Region.create!(
      name: "Name",
      display_name: "Display Name",
      alpha2_code_iso3166: "Alpha2 Code Iso3166",
      numeric_code_iso3166: "Numeric Code Iso3166",
      notes: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Display Name/)
    expect(rendered).to match(/Alpha2 Code Iso3166/)
    expect(rendered).to match(/Numeric Code Iso3166/)
    expect(rendered).to match(//)
  end
end
