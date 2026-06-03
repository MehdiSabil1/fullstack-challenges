def sum_with_for(min, max)
  # CONSTRAINT: you should use a for..end structure
  if min > max
    return -1
  else
    sum = 0
    for i in min..max
      sum += i
    end
    return sum
  end
end

def sum_with_while(min, max)
  # CONSTRAINT: you should use a while..end structure
  if min > max
    return -1
  else
    while min <= max
    sum ||= 0
    sum += min
    min += 1
    end
    return sum
  end
end
