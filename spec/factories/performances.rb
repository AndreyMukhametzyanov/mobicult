# frozen_string_literal: true

FactoryBot.define do
  factory :performance do
    name { "Performance #{rand(1..100)}" }
  end
end
