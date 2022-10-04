require "fizzbuzz"

RSpec.describe "fizzbuzz method" do
    it "for an ordinary number it returns the number" do
        # when I call fizzbuzz(1), I should get 1
        result = fizzbuzz(1)
        expect(result).to eq 1
    end

    it "if number is divisible by 3 it returns Fizz" do
        # when i call 3 i should get fizz
        result = fizzbuzz(9)
        expect(result).to eq "Fizz"
    end

    it "if number is divisible by 20 it returns Buzz" do
        # when i call 10 i should get buzz
        result = fizzbuzz(10)
        expect(result).to eq "Buzz"
    end

    it "if number is divisible by 15 it returns FizzBuzz" do
        # when i call 15 i should get fizzbuzz
        result = fizzbuzz(30)
        expect(result).to eq "FizzBuzz"
    end

end