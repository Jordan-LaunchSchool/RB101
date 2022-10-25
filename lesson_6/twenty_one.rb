=begin
  1. Initialize deck
  2. Deal cards to player and dealer
  3. Player turn: hit or stay
    - repeat until bust or "stay"
  4. If player bust, dealer wins.
  5. Dealer turn: hit or stay
    - repeat until total >= 17
  6. If dealer bust, player wins.
  7. Compare cards and declare winner.
=end

require 'pry'


SUITS = ['H', 'D', 'S', 'C']
NUMBER_CARDS = Array('2'..'10')
PICTURE_CARDS = ['J', 'Q', 'K']
ACE = ['A']

def prompt(msg)
  puts "=> " + msg.to_s
end

def initialise_deck
  deck = SUITS.product(NUMBER_CARDS) +
         SUITS.product(PICTURE_CARDS) +
         SUITS.product(ACE)
end

def calculate_score(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if PICTURE_CARDS.include?(value)
      sum += 10
    elsif ACE.include?(value)
      sum += 11
    else
      sum += value.to_i
    end
  end

  values.select { |value| ACE.include?(value)}.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def draw_card(deck)
  deck.pop
end

def busted?(score)
  score > 21
end

def enter_to_continue
  prompt "Press any key to continue"
  gets.chomp
end

def detect_winner(player_score, dealer_score)
  if player_score > dealer_score && !busted?(player_score)
    'Player'
  elsif dealer_score > player_score && !busted?(dealer_score)
    'Dealer'
  elsif dealer_score == player_score
    'Draw'
  end
end

def display_winner(player_score, dealer_score)
  case detect_winner(player_score, dealer_score)
  when 'Player' then prompt "You win!"
  when 'Dealer' then prompt "The dealer wins! Better luck next time!"
  when 'Draw' then prompt "It's a draw!"
  end
end

deck = initialise_deck.shuffle

player_cards = []
dealer_cards = []

2.times do
  player_cards << draw_card(deck)
  dealer_cards << draw_card(deck)
end

player_score = calculate_score(player_cards)
dealer_score = calculate_score(dealer_cards)

loop do
  system 'clear'
  prompt "Your hand includes #{player_cards}. You are currently on #{player_score}."
  prompt "The dealers holds a #{dealer_cards[0]} and an unknown card."

  prompt "Press (s) to 'stay' or (enter) to 'hit'."
  answer = gets.chomp
  if answer.downcase.start_with?('s')
    prompt "You choose to stay!"
    break
  end

  player_cards << draw_card(deck)
  prompt "You choose to hit!"
  prompt "You are dealt a #{player_cards.last}" 
  enter_to_continue
  
  player_score = calculate_score(player_cards)
  if busted?(player_score)
    prompt "You busted with #{player_score}, better luck next time!"
    break
  end
end

loop do
  break if busted?(player_score)
  enter_to_continue

  system 'clear'
  prompt "Your hand includes #{player_cards}. You are currently on #{player_score}."
  prompt "The dealers holds #{dealer_cards} and is currently on #{dealer_score}."
  
  if dealer_score <= 17
    dealer_cards << draw_card(deck)
    prompt "The dealer draws a #{dealer_cards.last}"
  else
    break
  end

  dealer_score = calculate_score(dealer_cards)
  if busted?(dealer_score)
    prompt "The dealer busted with #{dealer_score}! You win!"
    break
  end
end

display_winner(player_score, dealer_score)


