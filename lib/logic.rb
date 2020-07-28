module Player

  MOVE_GUIDE = ['1|2|3',
                '4|5|6',
                '7|8|9']  

  def player_symbol
    @game[:turn_count].even? ? 'x' : 'o'
  end

  def next_player
    player_symbol == 'x' ? 1 : 2
  end
  
  def current_player
    player_symbol == 'x' ? 2 : 1
  end

  def player_move(move_in)
    move = move_in
    if move < 4
      @game[:game_board][0][@game[:cntrl_mapping][move]] = player_symbol
    elsif move > 3 and move < 7
      @game[:game_board][1][@game[:cntrl_mapping][move]] = player_symbol
    else
      @game[:game_board][2][@game[:cntrl_mapping][move]] = player_symbol
    end

    @game[:win_conditions].each do |wc|
      wc[wc.index(move)] = player_symbol if wc.include?(move)
      if wc.all?(player_symbol) 
        @game[:win] = true
      end      
    end
    @game[:turn_count] += 1
    @game[:player] = next_player

  end
  

end

class Game
  include Player

  def initialize
    @game = {
      :positions => [1, 2, 3, 4, 5, 6, 7, 8, 9],
      :cntrl_mapping => { 1 => 0, 2 => 2, 3 => 4, 4 => 0, 5 => 2, 6 => 4, 7 => 0, 8 => 2, 9 => 4 },
      :win_conditions => [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]],
      :turn_count => 0,
      :player => 2,
      :win => false,
      :game_board => ['_|_|_',
                      '_|_|_',
                      ' | | ']
    }            
  end

  
end
