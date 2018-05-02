defmodule TicTacToe.Human do

  def get_index(_available_tile_indices, io) do
    io.gets("> ")
		|> String.trim()
		|> String.to_integer()
  end

end
