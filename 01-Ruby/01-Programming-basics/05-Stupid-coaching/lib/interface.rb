require_relative "coach_answer"
# TODO: Implement the program that makes you discuss with your coach from the terminal.

puts "Hello, I'm your coach. What do you want to say to me?"

message = ""
going_to_work = ["I am going to work right now!", "I AM GOING TO WORK RIGHT NOW!"]

until going_to_work.include?(message)
  print "You: "
  message = gets.chomp
  puts "Coach: #{coach_answer_enhanced(message)}"
end
Ce qui a changé :
