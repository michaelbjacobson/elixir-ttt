defmodule TicTacToe.Player do

  defstruct [
    :marker,
    :io
  ]

  def new(marker, io \\ IO) do
    %TicTacToe.Player{ marker: marker, io: io }
  end

def get_move(player) do
  player.io.gets("> ")
  |> String.trim()
  |> String.to_integer()
end

end
