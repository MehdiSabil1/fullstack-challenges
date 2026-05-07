require "hashes"

describe "#are_hash_keys_unique?" do
  it "should have the correct answer" do
    expect(are_hash_keys_unique?).to be true
  end
end

describe "#access_value" do
  it "returns the value for the key 'strawberry'" do
    hash = { "strawberry" => "sweet", "grape" => "tart", "banana" => "mushy" }
    expect(access_value(hash)).to eq "sweet"
  end
end

describe "#add_key_value" do
  it "adds 'mango' => 'delicious' to the hash" do
    hash = { "strawberry" => "sweet", "grape" => "tart" }
    add_key_value(hash)
    expect(hash["mango"]).to eq "delicious"
  end
end

describe "#update_value" do
  it "updates the value of 'grape' to 'sour'" do
    hash = { "strawberry" => "sweet", "grape" => "tart", "banana" => "mushy" }
    update_value(hash)
    expect(hash["grape"]).to eq "sour"
  end
end

describe "#remove_key" do
  it "removes the key 'banana' from the hash" do
    hash = { "strawberry" => "sweet", "grape" => "tart", "banana" => "mushy" }
    remove_key(hash)
    expect(hash.key?("banana")).to be false
  end
end
