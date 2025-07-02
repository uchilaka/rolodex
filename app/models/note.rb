# == Schema Information
#
# Table name: notes
#
#  id           :uuid             not null, primary key
#  notable_type :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  notable_id   :uuid             not null
#
# Indexes
#
#  index_notes_on_notable  (notable_type,notable_id)
#
class Note < ApplicationRecord
  belongs_to :notable, polymorphic: true

  has_rich_text :content

  validates :content, presence: true
end
