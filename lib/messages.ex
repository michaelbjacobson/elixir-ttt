defmodule TicTacToe.Messages do

  def welcome, do: "Let's play Tic-Tac-Toe!"

  def move_prompt(player) do
    case player.module do
      TicTacToe.ImpossibleComputer -> "Computer #{player.marker} is taking it's turn..."
      TicTacToe.EasyComputer -> "Computer #{player.marker} is taking it's turn..."
      TicTacToe.Human -> "Player #{player.marker}, please choose a tile..."
      _other -> "Please choose a tile..."
    end
  end

  def tile_occupied, do: "That tile is already occupied. Please select a free tile..."

  def game_options do
    """
    Please choose a game type...

    1. Human vs Human
    2. Human vs Computer
    3. Computer vs Human
    4. Computer vs Computer
    """
  end

  def tie_game, do: "Tie game!"

  def winner(player) do
    case player.module do
      TicTacToe.ImpossibleComputer -> "Computer #{player.marker} wins!"
      TicTacToe.EasyComputer -> "Computer #{player.marker} wins!"
      TicTacToe.Human -> "Player #{player.marker} wins!"
      _other -> "#{player.marker} wins!"
    end
  end

  def index_out_of_bounds, do: "Please enter only a single whole number between 1 and 9 inclusive..."

end
