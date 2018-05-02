defmodule TicTacToe.Program do
  alias TicTacToe.{ Game, Board, Player, Human, Computer }

  @human_vs_human Game.new(Board.new(), Player.new(Human, "X"), Player.new(Human, "O"))
  @human_vs_computer Game.new(Board.new(), Player.new(Human, "X"), Player.new(Computer, "O"))
  @computer_vs_human Game.new(Board.new(), Player.new(Computer, "X"), Player.new(Human, "O"))
  @computer_vs_computer Game.new(Board.new(), Player.new(Computer, "X"), Player.new(Computer, "O"))

  def run(1), do: play_game(@human_vs_human)
  def run(2), do: play_game(@human_vs_computer)
  def run(3), do: play_game(@computer_vs_human)
  def run(4), do: play_game(@computer_vs_computer)

  defp play_game(game) do
    clear_screen()
    Board.format_for_display(game.board) |> IO.puts()
    unless game.is_over? do
			IO.puts("Please choose a move...")
      next_move = Player.get_move(game.current_player, Board.available_tile_indices(game.board))
      Game.take_turn(game, next_move)
      |> play_game()
    end
  end

  defp clear_screen do
    IO.ANSI.format([:clear, :home]) |> IO.puts()
  end

end
