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

  def update(board, tile_index, player_symbol) do
    %{ board | tile_index => player_symbol }
  end

end
