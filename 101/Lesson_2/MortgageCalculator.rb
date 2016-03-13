require 'pry'

def prompt(message)
  Kernel.puts("=>#{message}")
end

def valid_input?(input)
  if input.to_f != 0
    if input < 0
      prompt("Please input a positive value")
    else
      return true
    end
  else
    prompt("Invalid input")
  end
end

loan_amount = ''

loop do
  prompt('Input the total Loan Amount')

  loan_amount = Kernel.gets.chomp().to_f

  break if valid_input?(loan_amount)
end

loan_duration_months = ''

loop do
  prompt('Input the loan duration in years')

  loan_duration_months = (Kernel.gets.chomp().to_f()) * 12

  break if valid_input?(loan_duration_months)
end

apr_rate = ''

loop do
  prompt('Input the APR(Annual Percentage Rate)')

  apr_rate = Kernel.gets.chomp().to_f
  
  break if valid_input?(apr_rate)
end

monthly_interest_rate = ((apr_rate / 12) / 100).to_f

monthly_payment = (loan_amount * monthly_interest_rate) / (1 - (1 + monthly_interest_rate)**-loan_duration_months)

prompt("Monthly Payment is: #{monthly_payment.to_f.round(2)}")
