# Takes a string as an argument
# returns the first five words then "..." if there are more than 5

require 'make_snippet'

RSpec.describe 'make_snippet method' do
it "takes an empty string and returns an empty string" do
result = make_snippet("")
expect(result).to eq ""
end
it "takes a string of less than five words and it returns that string" do
result = make_snippet("learning to test drive code")
expect(result).to eq "learning to test drive code"
end
it "takes a string of more than five words and it returns the first five words + ..." do
    result = make_snippet("learning to test drive code with Laura and Hassanat")
    expect(result).to eq "learning to test drive code..."
    end
end