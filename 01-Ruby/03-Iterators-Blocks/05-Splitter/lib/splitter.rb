def size_splitter(array, size)
  # TODO: Return an array of two arrays, the first containing
  #       words of length `size`, the second containing all the other words
  #       In addition to this split, each array should be *sorted*.
  array_limited = array.select { |word| word.length == size }.sort
  array_other = array.select { |word| word.length != size }.sort
  [array_limited, array_other]
end

def block_splitter(array)
  # TODO: Return an array of two arrays, the first containing
  #       elements for which the given block yields true,
  #       the second containing all the other elements.
  #       No sort needed this time
  array_true  = array.select { |element| yield(element) }
  array_false = array.reject { |element| yield(element) }
  [array_true, array_false]
end

array = ["apple", "banana", "avocado", "cherry"]
p block_splitter(array) { |element| element.start_with?("p") }
# => [["apple", "avocado"], ["banana", "cherry"]]
