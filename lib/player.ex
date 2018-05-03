defmodule TicTacToe.Player do

  defstruct [
    :marker,
    :module,
    :input
  ]

  def new(marker, module, input \\ IO) do
    %TicTacToe.Player{ marker: marker, module: module, input: input }
  end

  def get_move(player, available_tile_indices) do
    player.module.get_index(available_tile_indices, player.input)
  end

end
