require "verify_text"

RSpec.describe "verify_text method" do
=begin
    it "takes an empty string and returns a message saying there is no text to check" do
        result = verify_text("")
        expect(result).to eq "There is no text to check."
    end
=end
    it "takes a string with cap letter at beginning and punc at end and returns a message saying the sentence is great" do
        result = verify_text("The Cat sat on the mat!") 
        expect(result).to eq "This sentence is great."
    end
end