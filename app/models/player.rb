# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :team
  has_many :player_performances, dependent: :destroy
  has_many :performances, through: :player_performances
  has_many :matches_with_performances, through: :player_performances, class_name: 'Match', source: :match
  has_many :home_matches, through: :team, class_name: 'Match', foreign_key: 'team_home_id'
  has_many :away_matches, through: :team, class_name: 'Match', foreign_key: 'team_away_id'

  # проверяем выполнил ли игрок конкретный показатель
  def performance?(performance)
    player_performances.where(matches: team.matches.limit(5)).where(performance:).any?
  end
end
