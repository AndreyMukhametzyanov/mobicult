# frozen_string_literal: true

team1 = Team.find_or_create_by(name: 'Barca')
team2 = Team.find_or_create_by(name: 'Real')

# Создаем игроков для команд
player1 = Player.find_or_create_by(name: 'Sergio', age: 25, team: team1, role: 'defender')
player2 = Player.find_or_create_by(name: 'Benzema', age: 27, team: team1, role: 'midfielder')
player3 = Player.find_or_create_by(name: 'Sergio', age: 23, team: team1, role: 'striker')

player4 = Player.find_or_create_by(name: 'Gavi', age: 26, team: team2, role: 'defender')
player5 = Player.find_or_create_by(name: 'Xavi', age: 24, team: team2, role: 'midfielder')
player6 = Player.find_or_create_by(name: 'Messi', age: 22, team: team2, role: 'striker')

# Создаем матчи
match1 = Match.find_or_create_by(team_home: team1, team_away: team2, date: Date.today, score: '1-1')
match2 = Match.find_or_create_by(team_home: team2, team_away: team1, date: Date.today - 1, score: '2-1')
match3 = Match.find_or_create_by(team_home: team1, team_away: team2, date: Date.today - 2, score: '1-5')

# Создаем показатели
performance1 = Performance.find_or_create_by(name: 'пробежал 10+ км')
performance2 = Performance.find_or_create_by(name: 'сделал 70+ % точных передач')

# Создаем промежуточную таблицу
player_performance1 = PlayerPerformance.find_or_create_by(performance: performance1, match: match1, player: player6)
player_performance1 = PlayerPerformance.find_or_create_by(performance: performance2, match: match2, player: player1)
player_performance1 = PlayerPerformance.find_or_create_by(performance: performance1, match: match2, player: player1)
player_performance1 = PlayerPerformance.find_or_create_by(performance: performance2, match: match1, player: player6)
player_performance1 = PlayerPerformance.find_or_create_by(performance: performance1, match: match2, player: player1)
player_performance1 = PlayerPerformance.find_or_create_by(performance: performance1, match: match1, player: player6)
player_performance1 = PlayerPerformance.find_or_create_by(performance: performance2, match: match3, player: player6)
player_performance1 = PlayerPerformance.find_or_create_by(performance: performance2, match: match3, player: player6)
player_performance1 = PlayerPerformance.find_or_create_by(performance: performance1, match: match1, player: player6)
player_performance1 = PlayerPerformance.find_or_create_by(performance: performance1, match: match1, player: player6)
