# Tic-Tac-Toe

### Getting Started

#### What is it?
A simple, elegant, Tic-Tac-Toe game to be played via a command line, optimised for use in a
UNIX terminal.

#### Who is it for?
Anyone who enjoys playing Tic-Tac-Toe! The game supports either one or two players, depending on
the selected game mode.

#### Ace! How can I play it?
Good question. Just follow these simple steps:

##### Ensure you have a working Elixir environment on your machine
  1. Using your terminal, check that you have a working version of Elixir by running the following command `$ elixir --version`
  2. You should see something like this...
  ```
  Erlang/OTP 20 [erts-9.3] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

  Elixir 1.6.4 (compiled with OTP 20)
  ```
  3. If you received the message above, you should be good to go, move on to the next step in this guide.
  4. If you didn't receive the message above, [visit Elixir's offical site to find instructions on installing Elixir](https://elixir-lang.org/install.html), then come back here and re-try step 1

##### Install the program
  1. Clone [this](https://github.com/michaelbjacobson/elixir-ttt.git) GitHub repo onto your machine eg. `$ git clone https://github.com/michaelbjacobson/elixir-ttt.git`

##### Run the program
  1. Using your terminal, navigate into the main Tic-Tac-Toe directory eg. `$ cd ~/elixir-ttt`
  2. At the root of the elixir-ttt directory, run the following command `$ mix compile`
  3. Once the process started in step 2 has finished, run the following command `$ iex -S mix`
  4. Inside the Elixir shell entered in the previous step, enter the following command `iex(1)> TicTacToe.Program.run(2)`
  5. Enjoy the game!

#

### Testing

#### How do I run the tests?
1. First things first, make sure you've completed all the steps in the guide above
2. Using your terminal, navigate into the main Tic-Tac-Toe directory eg. `$ cd ~/elixir-ttt`
3. At the root of the elixir-ttt directory, run the following command `$ mix test`
4. Watch the tests pass!
