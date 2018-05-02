defmodule TicTacToe.Rules do
  alias TicTacToe.Board

  @winning_index_combos [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 4, 7], [2, 5, 8], [3, 6, 9],
    [1, 5, 9], [3, 5, 7]
  ]

  def winning_index_combos do
    @winning_index_combos
  end

  def game_is_over?(game) do
    game_is_won?(game) || game_is_tied?(game)
  end

  def game_is_won?(game) do
    game_is_won_by?(game, game.player_1) || game_is_won_by?(game, game.player_2)
  end

  def game_is_won_by?(game, player) do
    Enum.any?(winning_index_combos(), fn combo -> is_winning_combo?(game.board, combo, player.marker) end)
  end

  def game_is_tied?(game) do
    Board.is_full?(game.board) && !game_is_won?(game)
  end

  def is_winning_combo?(board, combo, player_marker) do
    board[Enum.at(combo, 0)] == player_marker &&
      board[Enum.at(combo, 1)] == player_marker &&
      board[Enum.at(combo, 2)] == player_marker
  end
end
