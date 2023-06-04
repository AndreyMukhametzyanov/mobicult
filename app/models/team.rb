# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :home_matches, class_name: 'Match', foreign_key: 'team_home_id', dependent: :destroy
  has_many :away_matches, class_name: 'Match', foreign_key: 'team_away_id', dependent: :destroy

  # находим как домашнии так и гостевые игры
  def matches
    home_matches.or(away_matches)
  end

  # выбрать Top-5 игроков по конкретному показателю в конкретной команде
  def top_players_by_performance(performance)
    Player.where(id: PlayerPerformance.where(performance:)
                                      .joins(:player)
                                      .where(players: { team_id: id })
                                      .group(:player_id)
                                      .order(Arel.sql('count(*) DESC'))
                                      .limit(5)
                                      .select(:player_id))
  end

  # выбрать Top-5 игроков по конкретному показателю по всем командам
  def self.top_players_by_performance(performance)
    Player.where(id: PlayerPerformance.where(performance:)
                                      .group(:player_id)
                                      .order(Arel.sql('count(*) DESC'))
                                      .limit(5)
                                      .select(:player_id))
  end
end
