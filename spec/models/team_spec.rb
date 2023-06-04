# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team do
  subject(:team) { build(:team) }

  let!(:match1) { create(:match, team_home: team) }
  let!(:performance1) { create(:performance, name: 'goals') }
  let!(:performance2) { create(:performance, name: 'assists') }

  describe 'associations' do
    it { is_expected.to have_many(:players) }
    it { is_expected.to have_many(:home_matches) }
    it { is_expected.to have_many(:away_matches) }
  end

  describe '#matches' do
    let!(:home_match) { create(:match, team_home: team) }
    let!(:away_match) { create(:match, team_away: team) }

    it 'returns both home and away matches' do
      expect(team.matches).to include(home_match, away_match)
    end
  end

  describe '#top_players_by_performance' do
    let!(:players) { create_list(:player, 5, team:) }
    let!(:player6) { create(:player, team:) }
    let!(:player_performances) do
      players.each do |player|
        create(:player_performance, player:, performance: performance1, match: match1)
      end
    end

    it 'returns top 5 players by performance in the team' do
      expect(team.top_players_by_performance(performance1).count).to eq(5)
      expect(team.top_players_by_performance(performance1)).to match_array(players)
    end
  end

  describe '#self.top_players_by_performance' do
    let!(:team1) { create(:team) }
    let!(:team2) { create(:team) }
    let!(:players1) { create_list(:player, 5, team: team1) }
    let!(:players2) { create_list(:player, 3, team: team2) }

    let!(:player_performances1) do
      players1.each do |player|
        create(:player_performance, player:, performance: performance1, match: match1)
      end
    end

    let!(:player_performances2) do
      players2.each do |player|
        create(:player_performance, player:, performance: performance2, match: match1)
      end
    end

    it 'returns top 5 players by performance' do
      expect(described_class.top_players_by_performance(performance1).count).to eq(5)
      expect(described_class.top_players_by_performance(performance1)).to match_array(players1)
      expect(described_class.top_players_by_performance(performance1)).not_to match_array(players2)
    end
  end
end
