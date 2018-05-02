defmodule TicTacToe.Player do

  defstruct [
    :marker,
    :module,
    :io
  ]

  def new(marker, module, io \\ IO) do
    %TicTacToe.Player{ marker: marker, module: module, io: io }
  end

  def get_move(player, available_tile_indices) do
    player.module.get_index(available_tile_indices, player.io)
  end

end
