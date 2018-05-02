defmodule ComputerTest do
  use ExUnit.Case
  alias TicTacToe.Computer

	test "Computer.get_index/2 returns a random integer from the given list of available indices" do
    available_tile_indices = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    computer_move = Computer.get_index(available_tile_indices, :io)
    assert Enum.member?(available_tile_indices, computer_move) == true
	end

end
