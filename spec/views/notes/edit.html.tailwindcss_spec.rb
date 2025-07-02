require 'rails_helper'

RSpec.describe "notes/edit", type: :view do
  let(:note) {
    Note.create!(
      notable: nil,
      content: nil
    )
  }

  before(:each) do
    assign(:note, note)
  end

  it "renders the edit note form" do
    render

    assert_select "form[action=?][method=?]", note_path(note), "post" do

      assert_select "input[name=?]", "note[notable_id]"

      assert_select "input[name=?]", "note[content]"
    end
  end
end
