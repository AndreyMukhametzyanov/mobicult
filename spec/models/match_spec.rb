# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Match do
  subject(:match) { create(:match) }

  describe 'associations' do
    it { is_expected.to belong_to(:team_home) }
    it { is_expected.to belong_to(:team_away) }
    it { is_expected.to have_many(:player_performances) }
    it { is_expected.to have_many(:performances) }
    it { is_expected.to have_many(:players) }
  end

  describe '#give_performance' do
    let(:player) { create(:player) }
    let(:performance) { create(:performance) }
    let(:player_performance) { PlayerPerformance.last }

    before { match.give_performance(player, performance) }

    it 'creates player_performance' do
      expect(PlayerPerformance.count).to eq(1)
      expect(player_performance.player).to eq(player)
      expect(player_performance.performance).to eq(performance)
    end
  end
end
