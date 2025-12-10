# frozen_string_literal: true

# manage te state of the 3*3 tic tac toe board and validate moves.
class Board
  attr_reader :grid

  def initialize
    @grid = %w[1 2 3 4 5 6 7 8 9]
  end

  def display
    puts '--- Tic Tac Toe Board ---'
    puts ''

    # This is the corrected visual output using specific indices (0 through 8)
    puts " #{@grid[0]} | #{@grid[1]} | #{@grid[2]} "
    puts '---+---+---'
    puts " #{@grid[3]} | #{@grid[4]} | #{@grid[5]} "
    puts '---+---+---'
    puts " #{@grid[6]} | #{@grid[7]} | #{@grid[8]} "

    puts ''
    puts '-------------------'
  end

  def valid_move?(index)
    # Checks if the cell is NOT already X or O
    @grid[index] != 'X' && @grid[index] != 'O'
  end

  def update_cell(index, marker)
    # Overwrites the number with the player's marker
    @grid[index] = marker
  end

  def grid_full?
    @grid.all? { |cell| %w[X O].include?(cell) }
  end
end
