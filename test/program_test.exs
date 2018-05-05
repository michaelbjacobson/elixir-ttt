defmodule ProgramTest do
  use ExUnit.Case
  alias TicTacToe.Game
  alias TicTacToe.Program
  import ExUnit.CaptureIO

  @blank_board TicTacToe.Board.new()
  @tied_board %{ 1 => "X", 2 => "O", 3 => "X", 4 => "O", 5 => "O", 6 => "X", 7 => "X", 8 => "X", 9 => "O" }
  @board_won_by_x %{ 1 => "X", 2 => "X", 3 => "X", 4 => "4", 5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9" }
  @board_won_by_o %{ 1 => "O", 2 => "O", 3 => "O", 4 => "4", 5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9" }
  @player_1 TicTacToe.Player.new("X", TicTacToe.Human)
  @player_2 TicTacToe.Player.new("O", TicTacToe.ImpossibleComputer)

  test "Program.display_board/1" do
    expected = """
     1 | 2 | 3
    ---+---+---
     4 | 5 | 6
    ---+---+---
     7 | 8 | 9\n
    """
    actual = capture_io(fn -> Program.display_board(Game.new(@blank_board, @player_1, @player_2)) end)
    assert actual == expected
  end

  test "Program.clear_screen/0" do
    expected = "\e[2J\e[H\e[0m\n"
    actual = capture_io(fn -> Program.clear_screen() end)
    assert actual == expected
  end

  test "Program.input_is_numeric?/1" do
    args = [
      { "-1", false },
      { "10", true },
      { "1", true },
      { "hello world", false },
      { "hello 42 world", false },
    ]
    for {arg, expected_result} <- args do
      assert Program.input_is_numeric?(arg) == expected_result
    end
  end

  test "Program.input_is_valid?/2" do
    args = [
      { "1", false },
      { "10", false },
      { "-1", false },
      { "hello", false },
      { "9", true }
    ]
    for {arg, expected_result} <- args do
      assert Program.input_is_valid?(arg, Game.new(@board_won_by_x, @player_1, @player_2)) == expected_result
    end
  end

  test "Program.display_prompt/1" do
    args = [
      { Game.new(@blank_board, @player_1, @player_2), "Player X, please choose a tile...\n" },
      { Game.new(@blank_board, @player_2, @player_1), "Computer O is taking it's turn...\n" }
    ]
    for {arg, expected_result} <- args do
      assert capture_io(fn -> Program.display_prompt(arg) end) == expected_result
    end
  end

  test "Program.display_game_over_message/1" do
    args = [
      { Game.new(@tied_board, @player_1, @player_2), "Tie game!\n" },
      { Game.new(@board_won_by_x, @player_1, @player_2), "Player X wins!\n" },
      { Game.new(@board_won_by_o, @player_1, @player_2), "Computer O wins!\n" }
    ]
    for {arg, expected_result} <- args do
      assert capture_io(fn -> Program.display_game_over_message(arg) end) == expected_result
    end
  end

end
