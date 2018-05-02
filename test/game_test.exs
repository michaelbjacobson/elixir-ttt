defmodule GameTest do
  use ExUnit.Case
  alias TicTacToe.Game

  test "Game.new/3 returns a new Game struct populated with the arguments given" do
    expected = %TicTacToe.Game{
      board: :board,
      current_player: :first_player,
      is_over?: false,
      player_1: :first_player,
      player_2: :second_player
    }
    actual = Game.new(:board, :first_player, :second_player)
    assert actual == expected
  end

end
