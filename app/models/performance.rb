# frozen_string_literal: true

class Performance < ApplicationRecord
  has_many :player_performances, dependent: :destroy
  has_many :players, through: :player_performances
  has_many :matches, through: :player_performances
end
