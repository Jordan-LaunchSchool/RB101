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

SUITS = %w[S D C H]
CARDS = %w[2 3 4 5 6 7 8 9 10 J Q K A]

def initialise_shuffled_deck
  deck = SUITS.product(CARDS).shuffle
end

def deal_cards_to_player_and_dealer(deck, player_cards, dealer_cards)
  2.times do 
    player_cards << deck.pop
    dealer_cards << deck.pop
  end  
end

def prompt(msg)
  puts "=> " + msg.to_s
end

def total(cards)
  score = 0
  cards.each do |card|
    if card[1] == 'A'
      score += 11
    elsif card[1].to_s.to_i == 0
      score += 10
    else
      score += card[1].to_i

    end
  end

  cards.select { |card| card[1] == 'A' }.count.times do
    score -= 10 if score > 21
  end

  score
end

def busted?(cards)
  total(cards) > 21
end

def detect_result(player_cards, dealer_cards)
	player_total = total(player_cards)
	dealer_total = total(dealer_cards)

	if player_total > 21
		:player_busted
	elsif dealer_total > 21
		:dealer_busted
	elsif player_total > dealer_total
		:player_win
	elsif dealer_total > player_total
		:dealer_win
	else
		:tie
	end
end

def display_result(player_cards, dealer_cards)
	result = detect_result(player_cards, dealer_cards)

	case result
	when :player_busted
		prompt "You busted! Dealer Wins!"
	when :dealer_busted
		prompt "Dealer busted! You Win!"
	when :dealer_win
		prompt "Dealer wins!"
	when :player_win
		prompt "Player wins!"
	when :tie
		prompt "It's a tie!"
	end
end

deck = initialise_shuffled_deck

player_cards = []
dealer_cards = []
deal_cards_to_player_and_dealer(deck, player_cards, dealer_cards)

loop do
  system 'clear'
  break if busted?(player_cards)
  prompt "The dealer has #{dealer_cards[0]} and an unknown card."
  prompt "Your cards are #{player_cards} and you are on #{total(player_cards)}."
  prompt "Would you like to (h)it or (s)tay?"
  answer = gets.chomp
  break if answer.start_with?('s') || busted?(player_cards)
  player_cards << deck.pop
	prompt "You draw a #{player_cards[-1]}."
	prompt "Press enter to continue..."
	gets.chomp
end

loop do
  system 'clear'
  break if busted?(player_cards)
  prompt "Your cards are #{player_cards} and you are on #{total(player_cards)}."
  prompt "The dealer has #{dealer_cards} and is on #{total(dealer_cards)}."
  break if total(dealer_cards) >= 17
  dealer_cards << deck.pop
  prompt "The dealer has drawn a #{dealer_cards[-1]}."
  prompt "Press enter to continue..."
  gets.chomp
	break if busted?(dealer_cards)
end

display_result(player_cards, dealer_cards)

