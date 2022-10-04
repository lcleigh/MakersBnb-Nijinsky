# Takes a string as an argument
# returns the first five words then "..." if there are more than 5

require "make_snippet"

RSpec.describe "make_snippet method" do

    it "returns an empty string if the argument is an empty string" do
        result = make_snippet("")
        expect(result).to eq ""
    end

    it "returns the string if the number of words is 5 or less"
end