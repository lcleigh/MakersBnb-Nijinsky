# verify_text
# takes on argument - a string of some text - a sentence
# returns a statement that tells you if the sentence is good or needs extra work

def verify_text(text)
    punctuation_req = /[!.?]/
    if text[0] == text[0].upcase && text[-1] =~ punctuation_req
        return "This sentence is great."
    else
        return "There is no text to check."
    end
end

