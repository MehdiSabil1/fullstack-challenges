def colorful?(number)
  # TODO: return true if the number is colorful, false otherwise
  digits = number.to_s.chars.map(&:to_i)
  products = Set.new

  (1..digits.length).each do |length|
    digits.each_cons(length) do |combination|
      product = combination.reduce(1, :*)
      return false if products.include?(product)
      products.add(product)
    end
  end

  true
end
