# frozen_string_literal: true

# Use instances of board and player to manage the game flow, turns, and win conditions, and user interaction loops.

require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board, :player1, :player2, :current_player

  def initialize
    @player1 = Player.new('Player 1', 'X')
    @player2 = Player.new('Player 2', 'O')
    @board = Board.new
    @current_player = @player1
  end

  def start
    puts "Starting a new game between #{@player1.name} and #{@player2.name}!"

    loop do
      @board.display
      index = get_player_input
      next unless @board.valid_move?(index)

      @board.update_cell(index, @current_player.marker)
      if win_condition_met?
        @board.display
        puts "🎉 Congratulations, #{@current_player.name} wins! 🎉"
        break
      elsif draw?
        @board.display
        puts "🤝 It's a draw! 🤝"
        break
      else
        switch_player
      end
    end
  end

  def switch_player
    @current_player = if current_player == @player1
                        @player2
                      else
                        @player1
                      end
  end
end

def get_player_input
  @current_player.player_move
  input = gets.chomp
  index = input.to_i - 1
  if index.between?(0, 8) && @board.valid_move?(index)
    index
  else
    puts 'Invalid move or spot taken. Please choose an available number (1-9).'
    get_player_input
  end
end

def draw?
  @board.grid_full? && !win_condition_met?
end

def win_condition_met?
  # List all possible winning combinations.
  winning_combinations = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],  # Rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8],  # Columns
    [0, 4, 8], [2, 4, 6]              # Diagonals
  ]
  winning_combinations.any? do |combo|
    combo.all? do |index|
      @board.grid[index] == @current_player.marker
    end
  end
end
