defmodule BoardFormatterTest do
  use ExUnit.Case
  alias TicTacToe.BoardFormatter
	alias TicTacToe.Board

	test "BoardFormatter.format_for_display/1 returns a formatted board string" do
	  expected = """
	   1 | 2 | 3
	  ---+---+---
	   4 | 5 | 6
	  ---+---+---
	   7 | 8 | 9

	  """
	  actual = Board.new() |> BoardFormatter.format_for_display()
	  assert actual == expected
	end

end
