# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    name { "Name #{rand(10)}" }
    age { rand(50) }
    team { create(:team) }
    role { 'defender' }
  end
end
