defmodule TicTacToe.Game do

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

end
