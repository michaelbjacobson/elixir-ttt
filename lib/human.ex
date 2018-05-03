defmodule TicTacToe.Human do

  def get_index(_available_tile_indices, input) do
    input.gets("> ") |> String.trim()
  end

end
