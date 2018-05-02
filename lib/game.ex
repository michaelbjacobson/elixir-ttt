defmodule TicTacToe.Game do
  alias TicTacToe.Board

  defstruct [
    :board,
    :player_1,
    :player_2,
    :current_player,
    :is_over?
  ]

  def new(board, player_1, player_2) do
    %TicTacToe.Game {
      board: board,
      player_1: player_1,
      player_2: player_2,
      current_player: player_1,
      is_over?: false
    }
  end

  def switch_players(game) do
    cond do
      game.current_player == game.player_1 -> %{ game | current_player: game.player_2}
      game.current_player == game.player_2 -> %{ game | current_player: game.player_1}
    end
  end

  def update_board(game, move_index) do
    updated_board = Board.update(game.board, move_index, game.current_player.marker)
    %{ game | board: updated_board }
  end

end
