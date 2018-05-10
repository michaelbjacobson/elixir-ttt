defmodule TicTacToe.Program do
  alias TicTacToe.{ Game, Rules, Messages, Board, BoardFormatter, Player, Human, ImpossibleComputer, EasyComputer }

  def run do
    clear_screen()
    Messages.welcome() |> IO.puts()
    set_up_game() |> play_game()
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

  def set_up_board do
    Messages.board_size_prompt() |> IO.puts()
    selection = IO.gets("> ") |> String.trim()
    case selection do
      "1" -> Board.new(3)
      "2" -> Board.new(4)
      _else -> set_up_board()
    end
  end

  def set_up_computer_difficulty do
    Messages.difficulty_prompt() |> IO.puts()
    selection = IO.gets("> ") |> String.trim()
    case selection do
      "1" -> EasyComputer
      "2" -> ImpossibleComputer
      _else -> set_up_computer_difficulty()
    end
  end

  def set_up_game_mode do
    Messages.game_mode_prompt() |> IO.puts()
    selection = IO.gets("> ") |> String.trim()
    case selection do
      "1" -> :human_v_human
      "2" -> :human_v_computer
      "3" -> :computer_v_human
      "4" -> :computer_v_computer
      _else -> set_up_game_mode()
    end
  end

  def set_up_game do
    board = set_up_board()
    game_mode = set_up_game_mode()
    if game_mode == :human_v_human do
      Game.new(board, Player.new("X", Human), Player.new("O", Human))
    else
      computer = set_up_computer_difficulty()
      case game_mode do
        :human_v_computer -> Game.new(board, Player.new("X", Human), Player.new("O", computer))
        :computer_v_human -> Game.new(board, Player.new("X", computer), Player.new("O", Human))
        :computer_v_computer -> Game.new(board, Player.new("X", computer), Player.new("O", computer))
      end
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
    BoardFormatter.format_for_display(game.board) |> IO.puts()
  end

end
