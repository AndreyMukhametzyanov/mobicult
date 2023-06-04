# frozen_string_literal: true

class CreatePlayerPerformances < ActiveRecord::Migration[7.0]
  def change
    create_table :player_performances do |t|
      t.belongs_to :match, null: false, foreign_key: true
      t.belongs_to :player, null: false, foreign_key: true
      t.belongs_to :performance, null: false, foreign_key: true

      # t.index ["performance_id", "player_id","match_id"], name: "index_performance_id_player_id_and_match_id", unique: true

      t.timestamps
    end
  end
end
