require "pry"

def game_hash
   {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        { :player_name => 'Alan Anderson',
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1 },
        { :player_name => 'Reggie Evans',
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7 },
        { :player_name => 'Brook Lopez',
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15 },
        { :player_name => 'Mason Plumlee',
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 11,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5 },
        { :player_name => 'Jason Terry',
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1 }
      ]
    }, 
    
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        { :player_name => 'Jeff Adrien',
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2 },
        { :player_name => 'Bismack Biyombo',
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
            :blocks => 15,
            :slam_dunks => 10 },
        { :player_name => 'DeSagna Diop',
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5 },
        { :player_name => 'Ben Gordon',
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0 },
        {:player_name => 'Kemba Walker',
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 7,
            :blocks => 5,
            :slam_dunks => 12 }
      ]
    }
    
  }

end

def num_points_scored(name_of_player)
  
  game_hash.each { |team, info|
    info[:players].each { |player|
      if player[:player_name] == name_of_player then
        return player[:points]
      end
    }
  }
  
end
  
def shoe_size(name_of_player)
  
  game_hash.each { |team, info|
    info[:players].each { |player|
      if player[:player_name] == name_of_player then
        return player[:shoe]
      end
    }
  }
  
end  
  
def team_colors(input_team)
  
  game_hash.each { |team, info|
    if info[:team_name] == input_team then
      return info[:colors]
    end
  }
  
end

def team_names
  
  teams_array = []
  game_hash.each { |team, info|
       teams_array.push(info[:team_name])
  }
  
  return teams_array
end

def player_numbers(input_team)
  
  team_numbers_array = []
  game_hash.each { |team, info|
    if info[:team_name] == input_team then
      info[:players].each { |player|
        team_numbers_array.push(player[:number])
      }
    end   
  }
  
  return team_numbers_array
end 

def player_stats(input_player)
  
    game_hash.each { |team, info|
    info[:players].each { |player|
      if player[:player_name] == input_player then
        return  player.select {|keys, values| keys != :player_name} 
      end
    }
  }
  
end 

def big_shoe_rebounds
  
  shoe_owner = ""
  shoe_owner_size = 0 
  
  game_hash.each { |team, info|
    info[:players].each { |player|
      if player[:shoe] > shoe_owner_size then
        shoe_owner = player[:player_name]
        shoe_owner_size = player[:shoe]
      end 
    }
  }
  
  game_hash.each { |team, info|
    info[:players].each { |player|
      if player[:player_name] == shoe_owner then
        return player[:rebounds]
      end
    }
  }
  
end 

def most_points_scored
  
  highest_scorer = ""
  highest_scorer_points = 0
  
  game_hash.each { |team, info|
    info[:players].each { |player|
      if player[:points] > highest_scorer_points then
        highest_scorer = player[:player_name]
        highest_scorer_points = player[:points]
      end 
    }
  }
  
  return highest_scorer
end 

def winning_team
  
  the_winner = ""
  the_winner_points = 0
  
  game_hash.each { |team, info|
    total = 0 
    info[:players].each { |player|
      total += player[:points]
      
      if total > the_winner_points then
        the_winner = info[:team_name]
        the_winner_points = total
      end 
    }
  }  
  
  return the_winner
end 

def player_with_longest_name
  
  longest_name = ""
  
  game_hash.each { |team, info|
    info[:players].each { |player|
      if player[:player_name].length > longest_name.length then
        longest_name = player[:player_name]
      end 
    }
  }
  
  return longest_name
end 

def long_name_steals_a_ton?
  
  long_name_top_stealer = false
  the_long_name = ""
  the_most_steals = 0
  
  game_hash.each { |team, info|
    info[:players].each { |player|
      if player[:player_name].length > the_long_name.length then
        the_long_name = player[:player_name]
        if player[:steals] > the_most_steals then
          the_most_steals = player[:steals]
          long_name_top_stealer = true
        else 
          long_name_top_stealer = false
        end
      end 
    }
  }
  
  return long_name_top_stealer
end






