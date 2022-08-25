# spock_lizard.rb

=begin

SCRATCH:
- user makes a choice
- computer makes a choice
- the winner is displayed

PROBLEM:
- Create rock paper scissors including spock and lizard
- Allow the player to select an option using first letter
(consider scissors and spock)
- Have the game keep score, first player to reach 3 wins

EXAMPLES:
Paper - beats rock and spock
Scissors - beats paper and lizard
Spock - beats scissors and rock
Lizard - beats spock and paper
Rock - beats lizard and scissors

DATA STRUCTURES:
- valid results
- Methods
- score counter for player and computer

ALGORITHM:
- define valid inputs
- define winning moves

- welcome message

- select an option message

- take input from user
    - allow user to select first letter
  - save input to variable
  - check if input is valid

- take input for computer

- update score

- check for winner
  - check if the player score or computer score == 3

- play again?

=end

VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

WINNING_CHOICES = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['spock', 'paper'],
  'spock' => ['scissors', 'rock']
}

def prompt(message)
  puts "=> #{message}"
end

def valid_input?(user_input)
  VALID_CHOICES.include?(user_input)
end

def check_winner(player, computer)
  if WINNING_CHOICES[player].include?(computer)
    'Player'
  elsif WINNING_CHOICES[computer].include?(player)
    'Computer'
  else
    'Tie'
  end
end

player_score = 0
computer_score = 0

prompt('Welcome to Rock, Paper, Scissors, Lizard, Spock')
prompt('First one to 3 wins!')

loop do
  player_choice = ''
  loop do
    prompt('Select an option: (R)ock, (P)aper, (Sc)issors, (L)izzard, (Sp)ock.')
    player_choice = gets.chomp.downcase

    if valid_input?(player_choice)
      player_choice = VALID_CHOICES[player_choice]
      break
    end

    prompt("Please select a valid option.")
  end

  computer_choice = VALID_CHOICES.values.sample

  prompt("You picked #{player_choice}. The computer picked #{computer_choice}.")

  case check_winner(player_choice, computer_choice)
  when 'Player'
    player_score += 1
    prompt('You won!')
  when 'Computer'
    computer_score += 1
    prompt('The computer wins.')
  when 'Tie'
    prompt("It's a tie!")
  end

  prompt("You are on #{player_score}. The computer is on #{computer_score}.")

  if player_score == 3
    prompt("You are the grand winner!")
    break
  elsif computer_score == 3
    prompt("The computer is the grand winner!")
    break
  end
end

prompt("Thank you for playing. Good bye!")
