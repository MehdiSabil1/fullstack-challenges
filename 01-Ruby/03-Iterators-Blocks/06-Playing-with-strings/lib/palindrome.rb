def palindrome?(a_string)
  # TODO: check if a_string is a palindrome
  cleaned = a_string.downcase.gsub(/[^a-z]/, "")
  return false if cleaned.empty?
  cleaned == cleaned.reverse
  end
