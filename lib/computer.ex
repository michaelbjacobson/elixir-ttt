defmodule TicTacToe.Computer do

  def get_index(available_tile_indices, _io) do
    Process.sleep(1000)
    Enum.random(available_tile_indices)
  end

end
