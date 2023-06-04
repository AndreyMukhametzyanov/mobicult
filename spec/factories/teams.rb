# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    name { "Team #{rand(1..100)}" }
  end
end
