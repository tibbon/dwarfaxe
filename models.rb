require 'ostruct'

class Person
  attr_accessor :strength, :intelligence, :dexterity, :constitution, :wisdom, :charisma, :max_hitpoints, :current_hitpoints, :thaco

  def initialize(*opt)
    roll_stats
  end
  
  def re_roll_stats
    roll_stats
  end
  
  #Strength Tables
  
  def hit_probability
    case @strength
    when 1
      -5
    when 2, 3
      -3
    when 4, 5
      -2
    when 6, 7
      -1
    when 8..16
      0
    when 17, 18
      1
    end
  end
  
  def damage_adjustment
    case @strength
    when 1
      -4
    when 2
      -2
    when 3..5
      -1
    when 6..15
      0
    when 16, 17
      1
    when 18
      2
    end
      
  end

  def weight_allowance
    case @strength
    when 1, 2
      1
    when 3
      5
    when 4, 5
      10
    when 6, 7
      20
    when 8, 9
      35
    when 10, 11
      40
    when 12, 13
      45
    when 14, 15
      55
    when 16
      70
    when 17
      85
    when 18
      110
    end
  end
  
  def max_press
    case @strength
    when 1
      3
    when 2
      5
    when 3
      10
    when 4, 5
      25
    when 6, 7
      55
    when 8, 9
      90
    when 10, 11
      115
    when 12, 13
      140
    when 14, 15
      170
    when 16
      195
    when 17
      220
    when 18
      255
    end
  end
  
  def open_doors
    case @strength
    when 1, 2
      1
    when 3
      2
    when 4, 5
      3
    when 6, 7
      4
    when 8, 9
      5
    when 10, 11
      6
    when 12, 13
      7
    when 14, 15
      8
    when 16
      9
    when 17
      10
    when 18
      11
    end
  end
  
  def bend_bars_or_lift_gates
    case @strength
    when 1..7
      0
    when 8, 9
      1
    when 10, 11
      2
    when 12, 13
      4
    when 14, 15
      7
    when 16
      10
    when 17
      13
    when 18
      16
    end
  end
  
  #Dexterity Tables
  
  def reaction_adjustment
    case @dexterity
    when 1
      -6
    when 2 
      -4
    when 3
      -3
    when 4
      -2
    when 5
      -1
    when 6..15
      0
    when 16
      1
    when 17, 18
      2
    when 19, 20
      3
    when 21..23
      4
    when 24, 25
      5
    end
      
  end
  
  def missile_attack_adjustment
    case @dexterity
    when 1
      -6
    when 2
      -4
    when 3
      -3
    when 4
      -2
    when 5
      -1
    when 6..15
      0
    when 16
      1
    when 17, 18
      2
    when 19, 20
      3
    when 21..23
      4
    when 24, 25
      5
    end
  end
  
  def defensive_adjustment
    case @dexterity
    when 1, 2
      5
    when 3
      4
    when 4
      3
    when 5
      2
    when 6
      1
    when 7..14
      0
    when 15
      -1
    when 16
      -2
    when 17
      -3
    when 18..20
      -4
    when 21..23
      -5
    when 24, 25
      -6
    end
      
  end
  
  # Constitution Tables
  
  def hit_point_adjustment
    case @constitution
    when 1
      -3
    when 2, 3
      -2
    when 4..6
      -1
    when 7..14
      0
    when 15
      1
    when 16
      2
    when 17
      2 # Needs modification to +3 for Warriors
    when 18
      2 #Needs modification to +4 for Warriors
    when 19, 20
      2 #Needs modification to +5 for warriors
    when 21..23
      2 #Needs modification to +6 for warriors
    when 24, 25
      2 #Needs modification to +7 for warriors
    end
  end
  
  def system_shock_percentage
    case @constitution
    when 1
      0.25
    when 2
      0.30
    when 3
      0.35
    when 4
      0.40
    when 5
      0.45
    when 6
      0.50
    when 7
      0.55
    when 8
      0.60
    when 9
      0.65
    when 10
      0.70
    when 11
      0.85
    when 12
      0.80
    when 13
      0.85
    when 14
      0.88
    when 15
      0.90
    when 16
      0.95
    when 17
      0.97
    when 18..24
      0.99
    when 25
      1.00
    end
  end
  
  def resurrection_survival_percentage
    case @constitution
    when 1
      0.30
    when 2
      0.35
    when 3
      0.40
    when 4
      0.45
    when 5
      0.50
    when 6
      0.55
    when 7
      0.60
    when 8
      0.65
    when 9
      0.70
    when 10
      0.75
    when 11
      0.80
    when 12
      0.85
    when 13
      0.90
    when 14
      0.92
    when 15
      0.94
    when 16
      0.96
    when 17
      0.98
    when 18..25
      1.00
    end
  end
  
  def poison_save
    case @constitution
    when 1
      -2
    when 2
      -1
    when 3..18
      0
    when 19, 20
      1
    when 21, 22
      2
    when 23, 24
      3
    when 25
      4
    end
  end
  
  def change_stat(stat, amount)
  end
  
  private
  
  def roll_stats
    @strength = Random.rand(3...18)
    @intelligence = Random.rand(3...18)
    @dexterity = Random.rand(3...18)
    @constitution = Random.rand(3...18)
    @wisdom = Random.rand(3...18)
    @charisma = Random.rand(3...18)
  end
  

end