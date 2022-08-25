# question_3.rb

# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

# advice = advice.split
# advice[6] = 'urgent'
# advice.join(' ')

advice.gsub!('important', 'urgent')