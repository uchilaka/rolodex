# == Schema Information
#
# Table name: regions
#
#  id                   :uuid             not null, primary key
#  alpha2_code_iso3166  :string           not null
#  display_name         :string
#  name                 :string           not null
#  numeric_code_iso3166 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_regions_on_alpha2_code_iso3166  (alpha2_code_iso3166) UNIQUE
#  index_regions_on_name                 (name) UNIQUE
#
class Region < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :alpha2_code_iso3166, presence: true, uniqueness: true
  validates :numeric_code_iso3166, allow_blank: true, format: { with: /\A\d{3}\z/, message: 'must be a 3-digit number' }
  validates :display_name, allow_blank: true, length: { maximum: 255 }
end
