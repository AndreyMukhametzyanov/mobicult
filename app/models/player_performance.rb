# frozen_string_literal: true

class PlayerPerformance < ApplicationRecord
  belongs_to :match
  belongs_to :performance
  belongs_to :player
end
