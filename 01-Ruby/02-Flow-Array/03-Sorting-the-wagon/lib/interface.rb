require_relative "wagon_sort"

# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  https://ruby-doc.org/3.3.5/Kernel.html#method-i-gets
#       - `chomp`: https://ruby-doc.org/3.3.5/String.html#method-i-chomp
students  = []
name      = nil

while name != ""
  puts students.empty? ? "Type a student name:" : "Type another student name (or press enter to finish):"
  name = gets.chomp

  students << name if name != ""
end

sorted_students = wagon_sort(students)
num_students = sorted_students.size


# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list
#         should be case-insensitive when sorting (FAILED - 1)


puts wagon_sort(students)

def pluralize(number, word)
  if number == 1
    word
  else
    "#{word}s"
  end
end

puts "Congratulations! Your Wagon has #{num_students} #{pluralize(num_students, 'student')}:"
if sorted_students.size >= 2
  puts "#{sorted_students[0..-2].join(', ')} and #{sorted_students.last}"
else
  puts sorted_students.first
end
