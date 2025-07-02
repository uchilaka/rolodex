class CreateNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :notes, id: :uuid do |t|
      t.references :notable, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
