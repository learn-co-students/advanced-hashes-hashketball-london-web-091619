def game_hash
  construct_team = lambda do |players|
    players.map do |player|
      {
        player[0] => {
          number: player[1],
          shoe: player[2],
          points: player[3],
          rebounds: player[4],
          assists: player[5],
          steals: player[6],
          blocks: player[7],
          slam_dunks: player[8]
        }
      }
    end
  end
  {
    home: {
      team_name: 'Brooklyn Nets',
      colors: %w[Black White],
      players: construct_team.call([
        ['Alan Anderson', 0, 16, 22, 12, 12, 3, 1, 1],
        ['Reggie Evans', 30, 14, 12, 12, 12, 12, 12, 7],
        ['Brook Lopez', 11, 17, 17, 19, 10, 3, 1, 15],
        ['Mason Plumlee', 1, 19, 26, 11, 6, 3, 8, 5],
        ['Jason Terry', 31, 15, 19, 2, 2, 4, 11, 1]
      ])
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: %w[Turquoise Purple],
      players: construct_team.call([
        ['Jeff Adrien', 4, 18, 10, 1, 1, 2, 7, 2],
        ['Bismack Biyombo', 0, 16, 12, 4, 7, 22, 15, 10],
        ['DeSagna Diop', 2, 14, 24, 12, 12, 4, 5, 5],
        ['Ben Gordon', 8, 15, 33, 3, 2, 1, 1, 0],
        ['Kemba Walker', 33, 15, 6, 12, 12, 7, 5, 12]
      ])
    }
  }
end

# Auxiliary functions
def every_player
  game_hash[:home][:players] + game_hash[:away][:players]
end

def lookup_stat(name, stat)
  player_stats(name)[stat]
end

def highest_scorer(stat)
  hiscore_and_name = every_player.reduce([0, 0]) do |score_name, player|
    score = player.values[0][stat]
    name = player.keys[0]
    if score > score_name[0]
      score_name[0] = score
      score_name[1] = name
    end

    score_name
  end

  hiscore_and_name[1]
end

def team_points(team)
  game_hash[team][:players].reduce(0) do |team_points, player|
    team_points += player.values[0][:points]

    team_points
  end
end

def get_hash_from_team_name(name)
  game_hash.select { |_side, data| data[:team_name].eql?(name) }.values[0]
end

# Required functions
def num_points_scored(player)
  lookup_stat(player, :points)
end

def shoe_size(player)
  lookup_stat(player, :shoe)
end

def team_colors(team)
  get_hash_from_team_name(team)[:colors]
end

def team_names
  game_hash.reduce([]) do |names, (_side, team)|
    names << team[:team_name]
  end
end

def player_numbers(team)
  get_hash_from_team_name(team)[:players].map do |player|
    player.values[0][:number]
  end
end

def player_stats(name)
  every_player.select { |player| player.keys[0].eql?(name) }.first.values[0]
end

def big_shoe_rebounds
  lookup_stat(highest_scorer(:shoe), :rebounds)
end

def most_points_scored
  highest_scorer(:points)
end

def winning_team
  team_points(:home) > team_points(:away) ? team_names[0] : team_names[1]
end

def player_with_longest_name
  player_names = every_player.map { |player| player.keys[0] }
  player_names.reduce do |memo, name|
    name.length > memo.length ? name : memo
  end
end

def long_name_steals_a_ton?
  highest_scorer(:steals) == player_with_longest_name
end