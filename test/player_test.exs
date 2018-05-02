defmodule PlayerTest do
  use ExUnit.Case
  alias TicTacToe.Player

  defmodule MockComputer do
    def get_index(_available_tile_indices, _io), do: "Computer.get_index/2 called!"
  end

  defmodule MockHuman do
    def get_index(_available_tile_indices, _io), do: "Human.get_index/2 called!"
  end

  test "Player.new/3 returns a new player struct" do
    expected = %TicTacToe.Player{io: IO, module: :human, marker: "X"}
    actual = Player.new("X", :human)
    assert actual == expected
  end

  test "Player.get_move/2 calls get_index/2 using the module assigned to given player" do
    human = Player.new(:marker, MockHuman)
    computer = Player.new(:marker, MockComputer)
    assert Player.get_move(human, :available_tile_indices) == "Human.get_index/2 called!"
    assert Player.get_move(computer, :available_tile_indices) == "Computer.get_index/2 called!"
  end

end
