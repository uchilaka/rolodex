class CreateRegions < ActiveRecord::Migration[8.0]
  def change
    create_table :regions, id: :uuid do |t|
      t.string :name
      t.string :display_name
      t.string :alpha2_code_iso3166
      t.string :numeric_code_iso3166

      t.timestamps
    end
    add_index :regions, :alpha2_code_iso3166, unique: true, if_not_exists: true
  end
end
