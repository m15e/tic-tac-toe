require 'logic'

describe Game do
  
  describe '#player_symbol' do
    it 'returns \'x\' if turn count is 0' do
      game = Game.new      
      expect(game.player_symbol).to eql('x')
    end

    it 'returns \'o\' if turn count is 1' do
      game = Game.new
      game.player_move(1)
      expect(game.player_symbol).to eql('o')
    end

    it 'returns \'x\' if turn count is 2' do
      game = Game.new
      game.player_move(1)
      game.player_move(4)
      expect(game.player_symbol).to eql('x')
    end
  end

  describe '#next_player' do
    it 'returns 2 if player_symbol is \'x\'' do
      game = Game.new
      game.player_move(9)
      expect(game.next_player).to eql(2)
    end
  end

  describe '#current_player' do
    it 'returns 1 if next_player returns 2' do
      game = Game.new
      game.player_move(9)
      expect(game.current_player).to eql(1)
    end
  end
end

