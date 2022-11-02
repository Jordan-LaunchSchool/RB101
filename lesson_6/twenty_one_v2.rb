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

SUITS = %w(S D C H)
CARDS = %w(2 3 4 5 6 7 8 9 10 J Q K A)

def initialise_shuffled_deck
  SUITS.product(CARDS).shuffle
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

def total_score(cards)
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

def busted?(total)
  total > 21
end

def detect_result(player_total, dealer_total)
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

def display_result(player_total, dealer_total, result)

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

def play_again?
  prompt "Would you like to play again? (y)es/(n)o?"
  play_again = gets.chomp
  play_again.downcase.start_with?('y')
end


loop do
  player_score = 0
  dealer_score = 0
  
  loop do
    deck = initialise_shuffled_deck

    player_cards = []
    dealer_cards = []
    deal_cards_to_player_and_dealer(deck, player_cards, dealer_cards)
    player_total = 0
    dealer_total = 0

    loop do
      system 'clear'
      player_total = total_score(player_cards)
      break if busted?(player_total)

      prompt "The dealer has #{dealer_cards[0]} and an unknown card."
      prompt "Your cards are #{player_cards} and you are on #{player_total}."
      prompt "Would you like to (h)it or (s)tay?"
      answer = gets.chomp
      break if answer.start_with?('s')

      player_cards << deck.pop
      prompt "You draw a #{player_cards[-1]}."
      prompt "Press enter to continue..."
      gets.chomp
    end

    loop do
      system 'clear'
      dealer_total = total_score(dealer_cards)
      break if busted?(player_total) || busted?(dealer_total)

      prompt "Your cards are #{player_cards} and you are on #{player_total}."
      prompt "The dealer has #{dealer_cards} and is on #{dealer_total}."

      break if dealer_total >= 17
      dealer_cards << deck.pop
      prompt "The dealer has drawn a #{dealer_cards[-1]}."
      prompt "Press enter to continue..."
      gets.chomp
    end

    result = detect_result(player_total, dealer_total)
    if result == :player_busted || result == :dealer_win
      dealer_score += 1
    elsif result == :dealer_busted || result == :player_win
      player_score += 1
    end

    
    display_result(player_total, dealer_total, result)
    prompt "You are on #{player_score}."
    prompt "The dealer is on #{dealer_score}."


    if player_score == 5 
      prompt "You won 5 times!"
      break
    elsif dealer_score == 5
      prompt "The dealer won 5 times!"
      break
    end
    prompt "Press enter to start next round..."
    gets.chomp
  end




  break unless play_again?
end

prompt "Thanks for playing 21! Goodbye!"