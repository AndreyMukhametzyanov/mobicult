# frozen_string_literal: true

class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :team_home, foreign_key: { to_table: :teams }
      t.references :team_away, foreign_key: { to_table: :teams }
      t.datetime :date
      t.string :score

      t.timestamps
    end
  end
end
