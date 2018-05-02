defmodule BoardTest do
  use ExUnit.Case
  alias TicTacToe.Board

  test "Board.new/0 returns a blank board" do
    expected = %{
      1 => "1", 2 => "2", 3 => "3",
      4 => "4", 5 => "5", 6 => "6",
      7 => "7", 8 => "8", 9 => "9"
    }
    actual = Board.new()
    assert actual == expected
  end

  test "Board.format_for_display/0 returns a formatted board string" do
    expected = """
     1 | 2 | 3
    ---+---+---
     4 | 5 | 6
    ---+---+---
     7 | 8 | 9
    """
    actual = Board.new() |> Board.format_for_display()
    assert actual == expected
  end

  test "Board.update/3 returns a new board, marked at the indicated index" do
    expected = %{
      1 => "1", 2 => "2", 3 => "3",
      4 => "4", 5 => "X", 6 => "6",
      7 => "7", 8 => "8", 9 => "9"
    }
    actual = Board.new() |> Board.update(5, "X")
    assert actual == expected
  end

end
