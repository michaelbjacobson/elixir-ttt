defmodule Runner do

  def game do
    board = TicTacToe.Board.new()
    p1 = TicTacToe.Player.new("X", TicTacToe.Human)
    p2 = TicTacToe.Player.new("O", TicTacToe.ImpossibleComputer)
    game = TicTacToe.Game.new(board, p1, p2)
    TicTacToe.Game.take_turn(5, game)
  end

end
