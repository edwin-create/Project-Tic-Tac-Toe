# frozen_string_literal: true

# To hold the name and marker of each player.
class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def player_move
    puts "#{name}'s turn (Marker: #{marker}). Enter a number 1-9:"
  end
end
