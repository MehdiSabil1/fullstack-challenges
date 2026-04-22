# NOTE: Read about Hash in the Ruby docs
# https://ruby-doc.org/3.3.5/Hash.html

# You can try launching `irb` to test some values
# irb> hash = { "name" => "Alice", "age" => 30 }
# irb> hash["name"]
# irb> hash["missing"]

def are_hash_keys_unique?
  # If you assign the same key twice, does the Hash keep both values?
  # e.g. { "a" => 1, "a" => 2 } — does "a" appear twice?
  # TODO: Return true if keys are unique (second assignment wins), false otherwise
  # NOTE: You should just return true or false. It's a quiz question.
  true
end

# Remember, docs are your friend
# - https://ruby-doc.org/3.3.5/Hash.html
def access_value(fruits)
  # TODO: return the value stored at the key "strawberry" 🍓 in the given hash `fruits`
  fruits["strawberry"]
end

def add_key_value(fruits)
  # TODO: set the value of the key "mango" 🥭 to "delicious"
  fruits["mango"] = "delicious"
end

def update_value(fruits)
  # TODO: update the value of the key "grape" 🍇 to "sour"
  fruits["grape"] = "sour"
end

def remove_key(fruits)
  # TODO: remove the key "banana" 🍌
  fruits.delete("banana")
end
