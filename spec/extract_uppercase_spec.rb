require "extract_uppercase"

RSpec.describe "extract_uppercase method" do
    
    it "returns an empty array when given an empty string" do
        result = extract_uppercase("")
        expect(result).to eq []
    end

    it "returns an empty array when given strings with words not in uppercase" do
        result = extract_uppercase("hello laura")
        expect(result).to eq []
    end

    it "returns an array of only uppercase words given strings with words in uppercase" do
        result = extract_uppercase("hello LAURA")
        expect(result).to eq ["LAURA"]
    end

    it "returns an array of all words if all words are uppercase" do
        result = extract_uppercase("HELLO LAURA LEIGH")
        expect(result).to eq ["HELLO", "LAURA", "LEIGH"]
    end

    it "returns an array of ONLY whole uppercase words given strings with words having some letters in uppercase" do
        result = extract_uppercase("HeLLo LaUrA")
        expect(result).to eq []
    end

    it "returns an array of ONLY the uppercase words even if they have characters" do
        result = extract_uppercase("HELLO! LAURA!")
        expect(result).to eq ["HELLO", "LAURA"]
    end



end