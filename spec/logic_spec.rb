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

    it 'return \'x\' if turn count is 2' do
      game = Game.new
      game.player_move(1)
      game.player_move(4)
      expect(game.player_symbol).to eql('x')
    end

  end
end

