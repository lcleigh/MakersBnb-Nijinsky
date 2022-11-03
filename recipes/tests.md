#Creating an ATM project.

#Need to identify what is needed for ATM.

=begin
We will need input from user (PIN)
Need to know and display balance
Need to offer option to withdraw
Option to change PIN?
=end

$pin
$balance

def access(user_input)
  #need to as user for PIN 
  #check PIN is correct
  if user_input == $pin
    true
  else
    puts('INCORRECT PIN')
    return false
  end
end

def view_balance(user_input)
end

def withdraw(user_input, amount)
    if access(user_input)
        if amount <= $balance 
                $balance -= amount
                return "You have withdrawn £#{amount}, your remaining balance is £#{$balance}"
        else
            puts "There is insufficient funds to make this withdrawel, would you like to see your balance? [Y/N]"
            choice = gets.chomp
            if choice == 'Y'
                view_balance(user_input)
            else 
                return  "Have a nice day."
            end
        end
    end
end