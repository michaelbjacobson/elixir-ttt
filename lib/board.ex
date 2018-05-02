defmodule TicTacToe.Board do

  def new do
    %{
      1 => "1", 2 => "2", 3 => "3",
      4 => "4", 5 => "5", 6 => "6",
      7 => "7", 8 => "8", 9 => "9"
    }
  end

  def format_for_display(board) do
    """
     #{board[1]} | #{board[2]} | #{board[3]}
    ---+---+---
     #{board[4]} | #{board[5]} | #{board[6]}
    ---+---+---
     #{board[7]} | #{board[8]} | #{board[9]}
    """
  end

  def available_tile_indices(board) do
    Enum.filter(board, fn {index, tile_content} -> tile_is_free?(index, tile_content) end)
    |> Enum.into(%{})
    |> Map.keys()
  end

  def update(board, tile_index, player_symbol) do
    %{ board | tile_index => player_symbol }
  end

  def tile_is_free?(index, tile_content) do
    Integer.to_string(index) == tile_content
  end

  def tile_is_occupied?(index, tile_content) do
    Integer.to_string(index) != tile_content
  end

  def is_full?(board) do
    Enum.all?(board, fn {index, tile_content} -> tile_is_occupied?(index, tile_content) end)
  end

  def is_empty?(board) do
    Enum.all?(board, fn {index, tile_content} -> tile_is_free?(index, tile_content) end)
  end

end
