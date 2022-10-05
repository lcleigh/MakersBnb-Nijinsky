require "reading_time"

RSpec.describe "reading_time method" do
    it "returns 0 if given an empty string" do
        result = reading_time("")
        expect(result).to eq "Estimated time: 0.0 minutes"
    end

    it "returns 1 if given a string of 200 words" do
        result = reading_time("hello " * 200)
        expect(result).to eq "Estimated time: 1.0 minutes"
    end

    it "returns 2 if given a string of 400 words" do
        result = reading_time("hello " * 400)
        expect(result).to eq "Estimated time: 2.0 minutes"
    end

    it "returns 0.05 if given a string of 10 words" do
        result = reading_time("The cat Sat on the mat Miaow said the Cat")
        expect(result).to eq "Estimated time: 0.05 minutes"
    end

    it "returns 0.05 if given a string of 10 words" do
        result = reading_time("The cat? Sat on the mat. Miaow said the Cat!")
        expect(result).to eq "Estimated time: 0.05 minutes"
    end

    
end