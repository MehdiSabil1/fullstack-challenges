require 'debugging_dojo'

puts <<~HEREDOC

    ___     _                       _                  ___      _
   /   \___| |__  _   _  __ _  __ _(_)_ __   __ _     /   \___ (_) ___
  / /\ / _ \ '_ \| | | |/ _` |/ _` | | '_ \ / _` |   / /\ / _ \| |/ _ \
 / /_//  __/ |_) | |_| | (_| | (_| | | | | | (_| |  / /_// (_) | | (_) |
/___,' \___|_.__/ \__,_|\__, |\__, |_|_| |_|\__, | /___,' \___// |\___/
                        |___/ |___/         |___/            |__/

HEREDOC

describe 'debugging_dojo.rb' do
  describe '#double_number' do
    it 'returns double the input number' do
      expect(double_number(2)).to eq(4)
      expect(double_number(-3)).to eq(-6)
      expect(double_number(0)).to eq(0)
    end
  end

  describe '#double_array' do
    it 'returns an array with each number doubled' do
      expect(double_array([1, 2, 3])).to eq([2, 4, 6])
      expect(double_array([-1, -2, -3])).to eq([-2, -4, -6])
      expect(double_array([])).to eq([])
    end
  end

  describe '#capitalize_words_starting_with_a' do
    it 'capitalizes words that start with "a"' do
      expect(capitalize_words_starting_with_a('apple banana apricot')).to eq('Apple banana Apricot')
      expect(capitalize_words_starting_with_a('banana apple apricot')).to eq('banana Apple Apricot')
      expect(capitalize_words_starting_with_a('')).to eq('')
    end
  end

end
