require "pry"

def game_hash
game_hash = {}
  game_hash[:home] = {:team_name => "Brooklyn Nets", :colors => ["Black", "White"], :players => [
    {name: "Alan Anderson", number: 0, shoe: 16, points: 22,rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
    {name: "Reggie Evans", number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
    {name: "Brook Lopez", number: 11, shoe: 17, points:17, rebounds:19, assists: 10, steals: 3, blocks: 1, slam_dunks:15},
    {name: "Mason Plumlee", number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
    {name: "Jason Terry", number: 31, shoe: 15, points: 19, rebounds:2, assists: 2, steals: 4, blocks:11, slam_dunks: 1}]}

  game_hash[:away] = {:team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"], :players => [
    {name: "Jeff Adrien", number:4, shoe:18, points:10, rebounds:1,assists:1, steals:2, blocks:7, slam_dunks:2},
    {name:"Bismack Biyombo", number: 0, shoe:16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks:10},
    {name:"DeSagna Diop", number: 2, shoe:14, points:24, rebounds:12, assists: 12, steals: 4, blocks:5, slam_dunks:5},
    {name:"Ben Gordon", number:8,shoe:15,points:33,rebounds:3,assists:2,steals:1,blocks:1,slam_dunks:0},
    {name:"Kemba Walker", number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}]}


game_hash
end

def num_points_scored(player)
game_hash.each do |outerkey, outerval|
  outerval.each do |innerkey, innervalue|
    if innerkey == :players
      innervalue.each do |innerplayer|
        if innerplayer[:name] == player
          return innerplayer[:points]
        end
      end
    end
  end
end
end

def shoe_size(player)
  game_hash.each do |outerkey, outerval|
    outerval.each do |innerkey, innervalue|
      if innerkey == :players
        innervalue.each do |innerplayer|
          if innerplayer[:name] == player
            return innerplayer[:shoe]
          end
        end
      end
    end
  end
end


def team_colors(teamname)
  game_hash.each do |outerkey, outerval|
      if outerval[:team_name] == teamname
        return outerval[:colors]
      end
  end
end

def team_names
teamnamearr = []
game_hash.each do |outerkey, outerval|
  teamnamearr.push(outerval[:team_name])
end
teamnamearr
end

def player_numbers(team_name)
  numbers = []
    game_hash.each do |outerkey, outerval|
        if outerval[:team_name] == team_name
          outerval.each do |innerkey, innervalue|
            if innerkey == :players
              innervalue.each do |innerplayer|
                  numbers.push(innerplayer[:number])
              end
            end

        end
    end
end
numbers
end

def player_stats(playername)
  game_hash.each do |outerkey, outerval|
    outerval.each do |innerkey, innervalue|
      if innerkey == :players
        innervalue.each do |innerplayer|
          if innerplayer[:name] == playername
            return innerplayer.reject!{|key| key == :name}
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
bigshoerebounds = 0
biggestshoe = 0
game_hash.each do |outerkey, outerval|
  outerval.each do |innerkey, innervalue|
    if innerkey == :players
      innervalue.each do |innerplayer|
        if innerplayer[:shoe] > biggestshoe
          biggestshoe = innerplayer[:shoe]
          bigshoerebounds = innerplayer[:rebounds]
        end
      end
    end
  end
end
bigshoerebounds
end


def most_points_scored
  mostpointsscored = 0
  mostpointscoredplayer = ""

  game_hash.each do |outerkey, outerval|
    outerval.each do |innerkey, innervalue|
      if innerkey == :players
        innervalue.each do |innerplayer|
          if innerplayer[:points] > mostpointsscored
            mostpointsscored = innerplayer[:points]
            mostpointscoredplayer = innerplayer[:name]
          end
        end
      end
    end
  end
  mostpointscoredplayer
end

def winning_team
#bad
  brooklyn_nets_score = 0
  charlotte_hornets_score = 0


  game_hash.each do |outerkey, outerval|
    outerval.each do |innerkey, innervalue|
      if innerkey == :players
        innervalue.each do |innerplayer|
          outerval[:team_name] == "Brooklyn Nets" ? brooklyn_nets_score += innerplayer[:points] : charlotte_hornets_score += innerplayer[:points]
        end
      end
    end
  end

  winner = brooklyn_nets_score > charlotte_hornets_score ? "Brooklyn Nets" : "Charlotte Hornets"
end

def player_with_longest_name
    longestnamelength = 0
    longestname = ""

    game_hash.each do |outerkey, outerval|
      outerval.each do |innerkey, innervalue|
        if innerkey == :players
          innervalue.each do |innerplayer|
            if innerplayer[:name].size > longestnamelength
              longestname = innerplayer[:name]
              longestnamelength = innerplayer[:name].size
            end
          end
        end
      end
    end
    longestname
end

def long_name_steals_a_ton?
  moststealsname = ""
  moststeals = 0

  #return true
  game_hash.each do |outerkey, outerval|
    outerval.each do |innerkey, innervalue|
      if innerkey == :players
        innervalue.each do |innerplayer|
          if innerplayer[:steals] > moststeals
            moststealsname = innerplayer[:name]
            moststeals = innerplayer[:steals]
          end
        end
      end
    end
  end
  moststealsname == player_with_longest_name
end




# Bad, should have made better use of DRY
