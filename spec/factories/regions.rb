# == Schema Information
#
# Table name: regions
#
#  id                   :uuid             not null, primary key
#  alpha2_code_iso3166  :string
#  display_name         :string
#  name                 :string
#  numeric_code_iso3166 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_regions_on_alpha2_code_iso3166  (alpha2_code_iso3166) UNIQUE
#
FactoryBot.define do
  factory :region do
    name { "MyString" }
    display_name { "MyString" }
    alpha2_code_iso3166 { "MyString" }
    numeric_code_iso3166 { "MyString" }
    notes { nil }
  end
end
