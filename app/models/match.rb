# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :team_home, class_name: 'Team'
  belongs_to :team_away, class_name: 'Team'
  has_many :player_performances, dependent: :destroy
  has_many :performances, through: :player_performances
  has_many :players, through: :player_performances

  # присваевыем/отмечаем, что игрок выполнил показатель в матче
  def give_performance(player, performance)
    player_performances.create(player:, performance:)
  end
end
