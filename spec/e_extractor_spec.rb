# Takes all letter e in a string and returns all es at the front

require "e_extractor"

RSpec.describe "e_extractor method" do
    
    it "given an empty string" do
        result = e_extractor("")
        expect(result).to eq ""
    end
    
    it "given a string wihtout any e - return same string" do
        result = e_extractor("jfhdnskfjdh")
        expect(result).to eq "jfhdnskfjdh"
    end

    it "given a string with an e in it brings it to the front" do
        result = e_extractor("slime")
        expect(result).to eq "eslim"
    end

    it "given a string with more than one e in it brings all of them to the front" do
        result = e_extractor("pineapple")
        expect(result).to eq "eepinappl"
    end

end