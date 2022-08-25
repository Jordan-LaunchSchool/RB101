# rock_paper_scissors.rb

=begin
- user makes a choice
- computer makes a choice
- the winner is displayed
=end

VALID_CHOICES = ['rock', 'paper', 'scissors']

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def prompt(message)
  puts "=> " + message
end

loop do

  player_choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}.")
    player_choice = gets.chomp

    if VALID_CHOICES.include?(player_choice)
      break
    else
      prompt('Not a valid choice.')
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{player_choice}; Computer chose: #{computer_choice}.")

  display_results(player_choice, computer_choice)

  prompt("Would you like to play again? (Y/N)")
  play_again = gets.chomp
  break unless play_again.downcase == 'y'
  
end

prompt("Thank you for playing. Good bye!")
