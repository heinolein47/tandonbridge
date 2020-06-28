#!/bin/ruby

#Kevin Rollins 2020. @heinolein47. For entertainment purposes only.

#Question from Bridge to Tandon at NYU (Spring 2020 Extended) -- HW12
# CH12 #7: Write a checkbook balancing program. The program will read in, from the console, the following for all checks that were not cashed as of the last time you balanced your checkbook: the number of each check (int), the amount of the check (double), and whether or not it has been cashed (1 or 0, boolean in the array). Use an array with the class as the type.

#See Check class
#The class should be a class for a check. There should be three member variables to record the check number, the check amount, and whether or not the check was cashed. The class for a check will have a member variable of type Money (as defined on page 662 in the book; Display 11.9) to record the check amount. So, you will have a class used within a class. The class for a check should have accessor and mutator functions as well as constructors and functions for both input and output of a check.

#Deposits class?
#In addition to the checks, the program also reads all the deposits (from the console; cin), the old and the new account balance (read this in from the user at the console; cin).

#You may want another array to hold the deposits. The new account balance should be the old balance plus all deposits, minus all checks that have been cashed.
#
# The program outputs the total of the checks cashed, the total of the deposits, what the new balance should be, and how much this figure differs from what the bank says the new balance is. It also outputs two lists of checks: the checks cashed since the last time you balanced your checkbook and the checks still not cashed. [ edit: if you can, Display both lists of checks in sorted order from lowest to highest check number.]



class Check
  #The class should be a class for a check. There should be three member variables to record the check number, the check amount, and whether or not the check was cashed. The class for a check will have a member variable of type Money (as defined on page 662 in the book; Display 11.9) to record the check amount. So, you will have a class used within a class. The class for a check should have accessor and mutator functions as well as constructors and functions for both input and output of a check.

  #member variables (attached to instances of the Check class)
  #I am initializing these to a nil value, which means "nothing" in Ruby
  @check_amount = nil  #Money, entered as a double
  @check_number = nil  #int
  @cashed = nil        #boolean

  #constructor
  def initialize(amount, id, cashed)
    @check_amount = Money.new(amount)
    @check_number = id
    #this "ternary operator" works like an if-then-else statement, returning a boolean
    @cashed = (cashed == 1) ? true : false
  end

  #accessors and mutators
  #ruby has convenience methods such as attr_accessor, attr_reader, attr_writer
  #See this page: https://stackoverflow.com/questions/4370960/what-is-attr-accessor-in-ruby
  def check_amount
    #How will check amount be used? For printing or calculation?
    @check_amount.get_value
  end

  def check_amount=(some_double)
    @check_amount.set_value(some_double)
  end

  #create setters and getters for @check_number and @cashed
  attr_accessor :check_number
  attr_accessor :cashed

end

#The implementation of this really doesn't matter, since we are using a libary function in C++
class Money

  @very_precise = nil

  def initialize(a_double)
    @very_precise = a_double
  end

  def set_value(doubly_so)
    @very_precise = doubly_so
  end

  def get_value
    @very_precise
  end

  def print_to_2_digits
    "go look up the string printing function"
  end

end


def check_balancer(old_balance, new_balance, checks, deposits)
  #in the C++ function it will probably create a Money value of 0.00 and add each check to it

  #add checks that have been cashed
  minus_sum = checks.reduce(0.0) do |memo, check|
    if (check.cashed)
      memo = memo + check.check_amount
    end
  end

  plus_sum = deposits.reduce(0.0) {|memo, deposit| memo = memo + deposit }
  total = old_balance + plus_sum - minus_sum
  difference = new_balance - total

  #results are all either Money objects or doubles, so can be bundled in an array
  results = [plus_sum, minus_sum, total, difference  ]
end


#No user interface is actually built, I use mocked data
def user_interface
  #Please enter new balance and old balance from the bank
  #Please enter a bunch of checks
  #Please enter a bunch of deposts
  old_balance = 5700.23
  bank_new_balance = 4300.15
  check0 = Check.new(231.75, 401, 0)
  check1 = Check.new(950.00, 513, 1)
  check2 = Check.new(100.00, 514, 1)
  check3 = Check.new(540.05, 515, 0)
  check_array = [check0, check1, check3, check4]
  deposit_array = [450.00, 75.25]
  results_array = check_balancer(old_balancer,check_array, deposit_array)
  deposit_sum, check_sum, my_new_balance, differences = results_array
  #present the data to the user

end
