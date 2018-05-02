defmodule PlayerTest do
  use ExUnit.Case
  alias TicTacToe.Player

  defmodule MockIO do
    def gets("> "), do: "1\n"
  end

  test "Player.new/2 returns a new player struct" do
    expected = %TicTacToe.Player{io: IO, marker: "X"}
    actual = Player.new("X", IO)
    assert actual == expected
  end

  test "Player.get_move/1 gets input from a user and returns it as an integer" do
    expected = 1
    actual = Player.get_move(Player.new("X", MockIO))
    assert actual == expected
  end

end
