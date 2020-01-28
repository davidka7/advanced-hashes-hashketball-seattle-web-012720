require "pry"
#pry gem 
#rubygem.org helps with finding gems you dont know about 
#game_hash.keys == [:away, :home] to get keys
#game_hash.class == hash to get data type
#game_hash.values to get all data
#commands to run terminal learn == rspec   rspec --fail-fast for specific or --ff 

def game_hash
  {:away=>{
    :team_name=>"Charlotte Hornets",
    :colors=>["Turquoise", "Purple"],
   :players=>[{
  :player_name=>"Jeff Adrien",
  :number=>4,
  :shoe=>18,
  :points=>10,
  :rebounds=>1,
  :assists=>1,
  :steals=>2,
  :blocks=>7,
  :slam_dunks=>2},
  {:player_name=>"Bismack Biyombo",
  :number=>0,
  :shoe=>16,
  :points=>12,
  :rebounds=>4,
  :assists=>7,
  :steals=>22,
  :blocks=>15,
  :slam_dunks=>10},
  {:player_name=>"DeSagna Diop",
  :number=>2,
  :shoe=>14,
  :points=>24,
  :rebounds=>12,
  :assists=>12,
  :steals=>4,
  :blocks=>5,
  :slam_dunks=>5},
  {:player_name=>"Ben Gordon",
  :number=>8,
  :shoe=>15,
  :points=>33,
  :rebounds=>3,
  :assists=>2,
  :steals=>1,
  :blocks=>1,
  :slam_dunks=>0},
  {:player_name=>"Kemba Walker",
  :number=>33,
  :shoe=>15,
  :points=>6,
  :rebounds=>12,
  :assists=>12,
  :steals=>7,
  :blocks=>5,
  :slam_dunks=>12}]
  },
    :home=>{
    :team_name=>"Brooklyn Nets",
    :colors=>["Black", "White"],
    :players=>[
  {:player_name=>"Alan Anderson",
  :number=>0,
  :shoe=>16,
  :points=>22,
  :rebounds=>12,
  :assists=>12,
  :steals=>3,
  :blocks=>1,
  :slam_dunks=>1},
  {:player_name=>"Reggie Evans",
  :number=>30,
  :shoe=>14,
  :points=>12,
  :rebounds=>12,
  :assists=>12,
  :steals=>12,
  :blocks=>12,
  :slam_dunks=>7},
  {:player_name=>"Brook Lopez",
  :number=>11,
  :shoe=>17,
  :points=>17,
  :rebounds=>19,
  :assists=>10,
  :steals=>3,
  :blocks=>1,
  :slam_dunks=>15},
  {:player_name=>"Mason Plumlee",
  :number=>1,
  :shoe=>19,
  :points=>26,
  :rebounds=>11,
  :assists=>6,
  :steals=>3,
  :blocks=>8,
  :slam_dunks=>5},
  {:player_name=>"Jason Terry",
  :number=>31,
  :shoe=>15,
  :points=>19,
  :rebounds=>2,
  :assists=>2,
  :steals=>4,
  :blocks=>11,
  :slam_dunks=>1}
  ]
  }

  
  }
end
#def num_points_scored(player)
 # i=0 
  #scored={}
  #while i< game_hash.length
  #players=0 
  #while player < game_hash[i][:players].length
  #scored << game_hash[i][:players][:points]
  #scored+=1
#end
 # i+=1
#end
#return scored
#end
# error given arguments is what you need, expected arguments is what there is or validates_length_of
#

def num_points_scored(players_name)
  # game_hash[:away][::players][0][:players_name]
  #game_hash[:away][::players][0][:points]
  #
  game_hash.each do |place, team| 
  team.each do |attribute, data|
  if attribute == :players 
  data.each do |player| 
    
 if player[:player_name] == players_name
   return player[:points]
 end
end
end
end
end
end


def shoe_size(players_name)
  game_hash.each{|place, team|
  team.each{|players, player_data|
    if players == :players
  player_data.each{|shoe_size| 
   if shoe_size[:player_name] == players_name
     return shoe_size[:shoe]
   end
  }
  end
  }
    
  }
end

def team_colors(team_name)
  array=[]
  game_hash.each{|place, team| 
 #binding.pry
  if team[:team_name]== team_name
      return array=team[:colors]
    end
  }
end

def team_names
  teams=[]
  game_hash.each{|place, team|
    teams << team[:team_name]
  }
  teams
end
 def player_numbers(team_name)
   array=[]
   game_hash.each{|place, team| 
   if team[:team_name] == team_name
  team.each{|players, players_data|
     if players == :players
    players_data.each{|player|
    array << player[:number]
    }
  end
    }
  end
  }
  array
  end
  
  def player_stats(players_name)
  hash={}
  game_hash.each{|place, team|
  team.each{|players, players_data|
  if players == :players
  players_data.each{|each|
  if each[:player_name] == players_name
  hash= each.delete_if do |k, v| k==:player_name
end
  #binding.pry
 end
  }
end
  }  
  }
  hash
  end
  
  def big_shoe_rebounds
    
    big_shoe=0 
    rebounds=0 
    game_hash.each {|place, team|
  team[:players].each{|player|
  if player[:shoe]> big_shoe
    big_shoe=player[:shoe]
    rebounds=player[:rebounds]
  end
  }
    }
   rebounds
  end
  
  
  #def most_points_scored
   # playerz=""
   # points_most=0 
   ## game_hash.each {|place, team|
   # team[:players]{|player|
   
#if player[:points]>points_most
#points_most=player[:points]
  #  playerz=player[:player_name]
 # end
 #   }
 #   }
  #  playerz
  #  binding.pry
  #end
  
  
    
  end
  def most_points_scored
  player_name = nil
  amounts_of_stat = 0
  game_hash.each do |place, team|
    team[:players].each do |player|
      if player[:points].is_a? String
        if player[:points].length > amount_of_stat
          amount_of_stat = player[:points].length
          player_name = player[:player_name]
        end
      elsif player[:points] > amount_of_stat
        amount_of_stat = player[:points]
        player_name = player[:player_name]
      end
    end
  end

  player_name
end

def iterate_through_players_for(name, stat)
  game_hash.each do |place, team|
    team[:players].each do |player|
      return player[stat] if player[:player_name] == name
    end
  end
end

def winning_team
 

  scores = { 'Brooklyn Nets' => 0, 'Charlotte Hornets' => 0 }

  game_hash.each do |place, team|
    team[:players].each do |player|
      scores[team[:team_name]] += iterate_through_players_for(player[:player_name], :points)
    end
  end

  scores.max_by { |_k, v| v }.first
end

def player_with_longest_name
   player_name = nil
  amount_of_stat = 0

  game_hash.each do |place, team|
    team[:players].each do |player|
      if player[:player_name].is_a? String
        if player[:player_name].length > amount_of_stat
          amount_of_stat = player[:player_name].length
          player_name = player[:player_name]
        end
      elsif player[:player_name] > amount_of_stat
        amount_of_stat = player[:player_name]
        player_name = player[:player_name]
      end
    end
  end
  player_name
  
end



def long_name_steals_a_ton?
   player_name = nil
  amount_of_stat = 0

  game_hash.each do |place, team|
    team[:players].each do |player|
      if player[:steals].is_a? String
        if player[:steals].length > amount_of_stat
          amount_of_stat = player[:steals].length
          player_name = player[:player_name]
        end
      elsif player[:steals] > amount_of_stat
        amount_of_stat = player[:steals]
        player_name = player[:player_name]
        if player_name==player_with_longest_name
          return true 
        end
      end
    end
  end

end