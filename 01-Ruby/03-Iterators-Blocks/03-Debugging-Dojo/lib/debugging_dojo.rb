# Hi, this is Alex, your cowoker here.
# I wanted to share some code with you that I'm having trouble with:

# First, is this one that _should_ be easy
# but I just can't seem to understand why it's not working.
# Can you help me out?
def double_number(number)
  # This method is supposed to double the input number
  number * 2
end

# Ok, thanks so much!
# Now, I have another one that I think is a bit more complicated.
# I have the right idea, but I can't seem to get the syntax right.
def double_array(numbers)
  # This method is supposed to double each number in the array
  numbers.map { |number| number * 2 }
end

# Next up, I'm really stumped on this one:
def capitalize_words_starting_with_a(string)
  # This method is supposed to capitalize words that start with 'a'
  processed_words = []
  string.split.each do |word|
    if word.start_with?('a')
      processed_words << word.capitalize
    else
      processed_words << word
    end
  end
  return processed_words.join(' ')
end 
