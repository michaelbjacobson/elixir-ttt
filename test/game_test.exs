defmodule GameTest do
  use ExUnit.Case
  alias TicTacToe.Game
  alias TicTacToe.Board
  alias TicTacToe.Player

  test "Game.new/3 returns a new Game struct populated with the arguments given" do
    expected = %TicTacToe.Game{
      board: %{1 => "1", 2 => "2", 3 => "3", 4 => "4", 5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9"},
      current_player: %TicTacToe.Player{io: IO, marker: "X"},
      is_over?: false,
      player_1: %TicTacToe.Player{io: IO, marker: "X"},
      player_2: %TicTacToe.Player{io: IO, marker: "O"}
    }
    actual = Game.new(Board.new, Player.new("X"), Player.new("O"))
    assert actual == expected
  end

  test "Game.switch_players/1 returns a new Game struct with the current player field updated" do
    expected = "O"
    actual = Game.new(Board.new, Player.new("X"), Player.new("O"))
             |> Game.switch_players()
             |> (fn game -> game.current_player.marker end).()
    assert actual == expected
  end

  test "Game.update_board/2 returns a new Game struct with the board field updated to contain the last move" do
    expected = "X"
    actual = Game.new(Board.new, Player.new("X"), Player.new("O"))
             |> Game.update_board(1)
             |> (fn game -> game.board[1] end).()
    assert actual == expected
  end

  test "Game.assert_is_over/1 returns a new Game struct with the is_over? field updated based on the board" do
    game_board_won_by_x = %{1 => "1", 2 => "2", 3 => "X", 4 => "4", 5 => "X", 6 => "6", 7 => "X", 8 => "8", 9 => "9"}
    expected = true
    actual = Game.new(game_board_won_by_x, Player.new("X"), Player.new("O"))
             |> Game.assert_is_over()
             |> (fn game -> game.is_over? end).()
    assert actual == expected
  end

end
