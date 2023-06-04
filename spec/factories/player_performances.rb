# frozen_string_literal: true

FactoryBot.define do
  factory :player_performance do
    player { create(:player) }
    performance { create(:performance) }
    match { create(:match) }
  end
end
