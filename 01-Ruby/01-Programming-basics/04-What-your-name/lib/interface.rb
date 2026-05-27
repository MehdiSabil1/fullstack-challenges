require_relative "compute_name"

# TODO: ask for the first name
puts "Please enter your first name:"
first_name = gets.chomp
# TODO: ask for the middle name
puts "Please enter your middle name:"
middle_name = gets.chomp
# TODO: ask for the last name
puts "Please enter your last name:"
last_name = gets.chomp
# TODO: Print a greeting to the user with the full name concatenated,

puts "Hello, #{compute_name(first_name, middle_name, last_name)}"
#       something like "Hello, Boris Paillard"
