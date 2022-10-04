# A method called count_words that takes a string as an argument and returns 
# he number of words in that string.
require "count_words"

RSpec.describe "count_words method" do

    it "takes an empty string and returns 0" do
        result = count_words("")
        expect(result).to eq 0
    end

    it "counts the words in the string and returns the number of words" do
        result = count_words("we are coding")
        expect(result).to eq 3
    end

end