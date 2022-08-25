# loan_calculator.rb

# get loan amount
# get annual percentage rate
# get loan duration 

# calculate monthly interest rate
# loan duration in months
# monthly payment

# monthly payment in ruby: 
# monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + j)**(-loan duration in months)))

# For example, to determine the monthly rate on a $1,200 loan with one year of payments and a 10 percent APR, 
# divide by 12, or 10 ÷ 12, to arrive at 0.0083 percent as the monthly rate.

def prompt(message)
  puts "=> " + message
end

loop do
  prompt("Welcome to the loan repayment calculator")

  loan_amount = ''
  loop do
    prompt("To begin, enter the loan amount:")
    loan_amount = gets.chomp

    break unless loan_amount.to_f < 1 || loan_amount.empty?
    prompt("Must enter a positive number.")
  end

  loan_duration_in_years = ''
  loop do
    prompt("What is the duration of the loan in years?")
    loan_duration_in_years = gets.chomp

    break unless loan_duration_in_years.to_f < 1 || loan_duration_in_years.empty?
    prompt("Must enter a positive number.")
  end

  annual_interest_rate = ''
  loop do
    prompt("What is the annual percentage rate on your $#{loan_amount} loan?")
    annual_interest_rate = gets.chomp
    
    break unless annual_interest_rate.to_f < 0 || annual_interest_rate.empty?
    prompt("Must enter a positive number.")
  end

  loan_duration_in_months = loan_duration_in_years.to_f * 12
  monthly_interest_rate = (annual_interest_rate.to_f / 100) / 12
  monthly_payment = loan_amount.to_f * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_in_months)))

  prompt("Your monthly payment is: $#{format('%.2f', monthly_payment)}")

  prompt("Press any key to continue or 'N' to exit.")
  answer = gets.chomp
  break if answer.downcase == 'n'
end

prompt("Thank you for using the Mortgage Calculator!")
prompt("Good bye!")
