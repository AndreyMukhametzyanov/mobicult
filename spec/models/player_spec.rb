# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player do
  subject(:player) { create(:player, team:) }

  let(:team) { create(:team) }

  describe 'associations' do
    it { is_expected.to belong_to(:team) }
    it { is_expected.to have_many(:matches_with_performances) }
    it { is_expected.to have_many(:performances) }
    it { is_expected.to have_many(:player_performances) }
    it { is_expected.to have_many(:home_matches) }
    it { is_expected.to have_many(:away_matches) }
  end

  describe '#performance?' do
    let!(:matches) { create_list(:match, 3, team_away: team) }
    let!(:match1) { create(:match, team_home: team) }
    let!(:performance1) { create(:performance, name: 'goals') }
    let!(:performance2) { create(:performance, name: 'assists') }
    let!(:performance3) { create(:performance, name: 'pass') }
    let!(:player_performance1) { create(:player_performance, player:, performance: performance1, match: match1) }
    let!(:player_performance2) { create(:player_performance, player:, performance: performance2, match: matches.first) }
    let!(:player_performance3) do
      create(:player_performance, player:, performance: performance1, match: matches.second)
    end
    let!(:player_performance4) { create(:player_performance, player:, performance: performance2, match: matches.last) }

    context 'when the player has performed in the last 5 matches of their team' do
      it 'returns true if the player has performed in the last 5 matches of their team' do
        expect(player).to be_performance(performance1)
        expect(player).to be_performance(performance2)
      end
    end

    context 'when the player has not performed in the last 5 matches of their team' do
      it 'returns false' do
        expect(player).not_to be_performance(performance3)
        expect(player).not_to be_performance(performance3)
      end
    end
  end
end
