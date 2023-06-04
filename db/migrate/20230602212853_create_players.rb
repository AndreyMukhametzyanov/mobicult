# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :role, null: false
      t.belongs_to :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
