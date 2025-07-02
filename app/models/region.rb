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
class Region < ApplicationRecord
  has_many :notes, as: :notable, dependent: :destroy

  accepts_nested_attributes_for :notes

  validates :name, presence: true
  validates :display_name, presence: true
  validates :alpha2_code_iso3166, presence: true, uniqueness: true, length: { is: 2 }
  validates :numeric_code_iso3166, numericality: { only_integer: true }, allow_blank: true
  validates :numeric_code_iso3166, allow_blank: true, length: { is: 3 }
end
