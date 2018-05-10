defmodule MessagesTest do
  use ExUnit.Case
  alias TicTacToe.Messages
  alias TicTacToe.Player

  test "Messages.welcome/0 returns a welcome message string" do
    expected = "Let's play Tic-Tac-Toe!"
    actual = Messages.welcome()
    assert actual == expected
  end

  test "Messages.move_prompt/1 returns the relevant message string for the current player" do
    human_x = Player.new("X", TicTacToe.Human)
    computer_o = Player.new("O", TicTacToe.ImpossibleComputer)
    args = [
      { human_x, "Player X, please choose a tile..." },
      { computer_o, "Computer O is taking it's turn..." }
    ]
    for {arg, expected_result} <- args do
      assert Messages.move_prompt(arg) == expected_result
    end
  end

  test "Messages.tile_occupied/0 returns a message string indicating that a tile is already occupied" do
    expected = "That tile is already occupied. Please select a free tile..."
    actual = Messages.tile_occupied()
    assert actual == expected
  end

  test "Messages.tie_game/0 returns a message string informing the user that the game is tied" do
    expected = "Tie game!"
    actual = Messages.tie_game()
    assert actual == expected
  end

  test "Messages.winner/1 returns a message string displaying the winner of the game" do
    human_o = Player.new("O", TicTacToe.Human)
    computer_x = Player.new("X", TicTacToe.ImpossibleComputer)
    args = [
      { human_o, "Player O wins!" },
      { computer_x, "Computer X wins!" }
    ]
    for {arg, expected_result} <- args do
      assert Messages.winner(arg) == expected_result
    end
  end

  test "Messages.index_out_of_bounds/0 returns a message string informing the user that a given index is out of bounds" do
    expected = "Please enter only a single whole number between 1 and 9 inclusive..."
    actual = Messages.index_out_of_bounds()
    assert actual == expected
  end

  test "Messages.game_mode_prompt/0 returns a message string containing the numbered game options" do
    expected = """
               Please select a game mode...

               1. Human vs Human
               2. Human vs Computer
               3. Computer vs Human
               4. Computer vs Computer
               """
    actual = Messages.game_mode_prompt()
    assert actual == expected
  end

  test "Messages.difficulty_prompt/0 returns a message string containing the numbered computer difficulty options" do
    expected = """
               Please select a computer difficulty...

               1. Easy
               2. Unbeatable
               """
    actual = Messages.difficulty_prompt()
    assert actual == expected
  end

  test "Messages.board_size_prompt/0 returns a message string containing the numbered board size options" do
    expected = """
               Please select a board size...

               1. Standard (3x3)
               2. Large (4x4)
               """
    actual = Messages.board_size_prompt()
    assert actual == expected
  end

end
