# frozen_string_literal: true

FactoryBot.define do
  factory :match do
    team_home { create(:team) }
    team_away { create(:team) }
    date { Time.zone.today - rand(10) }
    score { "#{rand(5)}-#{rand(5)}" }
  end
end
