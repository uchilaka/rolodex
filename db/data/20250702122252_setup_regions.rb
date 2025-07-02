# frozen_string_literal: true

class SetupRegions < ActiveRecord::Migration[8.0]
  def up
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

  private

  def countries
    Rails.application.config_for(:countries)
  end
end
