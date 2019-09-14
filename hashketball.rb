require 'pry'

def game_hash
  game = { 
    :home => {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"], 
      :players => [
        {:player_name => "Alan Anderson", 
         :number => 0, 
         :shoe => 16, 
         :points => 22, 
         :rebounds => 12, 
         :assists => 12, 
         :steals => 3, 
         :blocks => 1, 
         :slam_dunks => 1
        },
        {:player_name => "Reggie Evans", 
         :number => 30, 
         :shoe => 14, 
         :points => 12, 
         :rebounds => 12, 
         :assists => 12, 
         :steals => 12, 
         :blocks => 12, 
         :slam_dunks => 7
        },
        {:player_name => "Brook Lopez", 
         :number => 11, 
         :shoe => 17, 
         :points => 17, 
         :rebounds => 19, 
         :assists => 10, 
         :steals => 3, 
         :blocks => 1, 
         :slam_dunks => 15
        },
       {:player_name => "Mason Plumlee", 
        :number => 1, 
        :shoe => 19, 
        :points => 26, 
        :rebounds => 11, 
        :assists => 6, 
        :steals => 3, 
        :blocks => 8, 
        :slam_dunks => 5
        },
       {:player_name => "Jason Terry", 
        :number => 31, 
        :shoe => 15, 
        :points => 19, 
        :rebounds => 2, 
        :assists => 2, 
        :steals => 4, 
        :blocks => 11, 
        :slam_dunks => 1
       }
         ],
     },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {:player_name => "Jeff Adrien", 
         :number => 4, 
         :shoe => 18, 
         :points => 10,  
         :rebounds => 1, 
         :assists => 1, 
         :steals => 2, 
         :blocks => 7, 
         :slam_dunks => 2
        },
        {:player_name => "Bismack Biyombo", 
         :number => 0, 
         :shoe => 16, 
         :points => 12, 
         :rebounds => 4, 
         :assists => 7, 
         :steals => 22, 
         :blocks => 15, 
         :slam_dunks => 10
       },
        {:player_name => "DeSagna Diop", 
         :number => 2, 
         :shoe => 14, 
         :points => 24, 
         :rebounds => 12, 
         :assists => 12, 
         :steals => 4, 
         :blocks => 5, 
         :slam_dunks => 5
        },
        {:player_name => "Ben Gordon", 
         :number => 8, 
         :shoe => 15, 
         :points => 33, 
         :rebounds => 3, 
         :assists => 2, 
         :steals => 1, 
         :blocks => 1, 
         :slam_dunks => 0
        },
        {:player_name => "Kemba Walker", 
         :number => 33, 
         :shoe => 15, 
         :points => 6, 
         :rebounds => 12, 
         :assists => 12, 
         :steals => 7, 
         :blocks => 5, 
         :slam_dunks => 12
        }
         ]
      }
     }
    return game
end
  
def num_points_scored(player_name)
  game_hash.each do |place_hash, team_hash|
    team_hash.each do |team_info, details|
      if team_info == :players
        details.each do |player_info|
         if player_info[:player_name] == player_name 
          return player_info[:points]
         end    
        end   
      end
    end
  end
end  
  
def shoe_size(player_name)
  game_hash.each do |place_hash, team_hash|
    team_hash.each do |team_info, details|
      if team_info == :players
        details.each do |player_info|
         if player_info[:player_name] == player_name 
          return player_info[:shoe]
         end    
        end   
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |place_hash, team_hash|
    if team_hash[:team_name] == team_name
      return team_hash[:colors]
    end    
  end  
end

def team_names
  game_hash.map do |place_hash, team_hash|
    team_hash[:team_name]
  end
end    

def player_numbers(team_name)
  numbers = []
  game_hash.map do |place_hash, team_hash|
    if team_hash[:team_name] == team_name
      team_hash.each do |team_info, details|
        if team_info == :players
          details.each do |player_info|
            numbers << player_info[:number]
          end  
        end
      end
    end
  end  
  numbers
end

def player_stats(player_name)
  stats = {}
  game_hash.each do |place_hash, team_hash|
    team_hash.each do |team_info, details|
      if team_info == :players 
        details.each do |player_info|
          if player_info[:player_name] == player_name
            stats = player_info.delete_if do |key, value|
              key == :player_name
            end
          end
        end  
      end
    end
  end
  stats
end

def big_shoe_rebounds
biggest_shoe = {:shoe => 0}
 game_hash.each do |place_hash, team_hash|
  team_hash.each do |team_info, details|
    if team_info == :players
      details.each do |player_info|
        biggest_shoe = player_info if player_info[:shoe] > biggest_shoe[:shoe]
      end
    end  
  end  
 end
  return biggest_shoe[:rebounds]
end

def most_points_scored
most_points = {:points => 0}
 game_hash.each do |place_hash, team_hash|
  team_hash.each do |team_info, details|
    if team_info == :players
      details.each do |player_info|
        most_points = player_info if player_info[:points] > most_points[:points]
      end
    end  
  end  
 end
  return most_points[:player_name]
end

def winning_team
winner = {}
 game_hash.each do |team, team_details_hash|
   team_points = 0
   team_details_hash[:players].each do |player_info|
     team_points += player_info[:points]
   end
   winner[team_details_hash[:team_name]] = team_points
 end
 winner.key(winner.values.max)
end

def player_with_longest_name
longest_name = []
  game_hash.each do |place_hash, team_hash|
    team_hash.each do |team_info, details|
      if team_info == :players
        details.each do |player_info|
          longest_name << player_info[:player_name]
        end
      end
    end
  end
  return longest_name.max_by {|names| names.length}
end

def long_name_steals_a_ton?
most_steals = {:steals => 0}
  game_hash.each do |place_hash, team_hash|
    team_hash.each do |team_info, details|
      if team_info == :players
        details.each do |player_info|
          most_steals = player_info if player_info[:steals] > most_steals[:steals]
        end
      end
    end
  end
    return true if most_steals[:player_name] == player_with_longest_name
end