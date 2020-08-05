require 'logic'

describe Game do
  let(:game) { Game.new }

  describe '#player_symbol' do
    it 'returns \'x\' if turn count is 0' do
      expect(game.player_symbol).to eql('x')
    end

    it 'returns \'o\' if turn count is 1' do
      game.player_move(1)
      expect(game.player_symbol).to eql('o')
    end

    it 'returns \'x\' if turn count is 2' do
      game.player_move(1)
      game.player_move(4)
      expect(game.player_symbol).to eql('x')
    end
  end

  describe '#next_player' do
    it 'returns 2 if player_symbol is \'x\'' do
      game.player_move(9)
      expect(game.next_player).to eql(2)
    end
  end

  describe '#current_player' do
    it 'returns 1 if next_player returns 2' do
      game.player_move(9)
      expect(game.current_player).to eql(1)
    end
  end

  describe '#player_move' do
    it 'correctly places a symbol on the board' do
      game.player_move(9)
      expect(game.instance_variable_get(:@game)[:game_board][2]).to eql(' | |x')
    end

    context 'switches between player 1 & player 2' do
      it 'switch to player 2 after player 1 makes a move' do
        game.player_move(9)
        expect(game.instance_variable_get(:@game)[:player]).to eql(2)
      end

      it 'switch to player 1 after player 2 makes a move' do
        game.player_move(9)
        game.player_move(2)
        expect(game.instance_variable_get(:@game)[:player]).to eql(1)
      end
    end

    it 'correctly identifies a win for player 1' do
      [1, 2, 5, 3, 9].each { |num| game.player_move(num) }
      expect(game.instance_variable_get(:@game)[:win]).to eql(true)
    end

    it 'correctly identifies a win for player 2' do
      [1, 5, 2, 3, 4, 7].each { |num| game.player_move(num) }
      expect(game.instance_variable_get(:@game)[:win]).to eql(true)
    end

    it 'correctly increments turn count' do
      [1, 2, 3, 4, 5].each { |num| game.player_move(num) }
      expect(game.instance_variable_get(:@game)[:turn_count]).to eql(5)
    end
  end
end
