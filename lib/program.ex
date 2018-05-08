defmodule TicTacToe.Program do
  alias TicTacToe.{ Game, Rules, Messages, Board, Player, Human, ImpossibleComputer }

  @human_vs_human Game.new(Board.new(), Player.new("X", Human), Player.new("O", Human))
  @human_vs_computer Game.new(Board.new(), Player.new("X", Human), Player.new("O", ImpossibleComputer))
  @computer_vs_human Game.new(Board.new(), Player.new("X", ImpossibleComputer), Player.new("O", Human))
  @computer_vs_computer Game.new(Board.new(), Player.new("X", ImpossibleComputer), Player.new("O", ImpossibleComputer))

  def run do
    clear_screen()
    Messages.welcome() |> IO.puts()
    game_type = get_game_type()
    case game_type do
      1 -> play_game(@human_vs_human)
      2 -> play_game(@human_vs_computer)
      3 -> play_game(@computer_vs_human)
      4 -> play_game(@computer_vs_computer)
    end
  end

  def play_game(game) do
    clear_screen()
    display_board(game)
    if game.is_over? do
      display_game_over_message(game)
    else
      get_next_move(game)
      |> Game.take_turn(game)
      |> play_game()
    end
  end

  def get_next_move(game) do
    display_prompt(game)
    input = Player.get_move(game.current_player, game)
    if input_is_valid?(input, game) do
      String.to_integer(input)
    else
      get_next_move(game)
    end
  end

  def get_game_type do
    Messages.game_options() |> IO.puts()
    IO.gets("> ")
    |> String.trim()
    |> String.to_integer()
  end

  def display_game_over_message(game) do
    cond do
      Rules.game_is_tied?(game) -> Messages.tie_game() |> IO.puts()
      Rules.game_is_won_by?(game, game.player_1) -> Messages.winner(game.player_1) |> IO.puts()
      Rules.game_is_won_by?(game, game.player_2) -> Messages.winner(game.player_2) |> IO.puts()
    end
  end

  def display_prompt(game) do
    game.current_player
    |> Messages.move_prompt()
    |> IO.puts()
  end

  def input_is_valid?(input, game) do
    input_is_numeric?(input) &&
    Board.tile_index_in_bounds?(game.board, String.to_integer(input)) &&
    Board.tile_is_free?(String.to_integer(input), game.board[String.to_integer(input)])
  end

  def input_is_numeric?(input) do
    Regex.match?(~r/^[0-9]*$/, input)
  end

  def clear_screen do
    IO.ANSI.format([:clear, :home]) |> IO.puts()
  end

  def display_board(game) do
    Board.format_for_display(game.board) |> IO.puts()
  end

end
