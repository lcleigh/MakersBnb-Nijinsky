# extract_uppercase method
# takes one argument - some text (string)
# returns an array of only the uppercase words

def extract_uppercase(text)
    list_of_words = text.split(" ")
    list_of_words.delete_if{|word| word != word.upcase}
    no_chars = list_of_words.map {|word| word.gsub(/[^A-Z]/, "")}
    return no_chars
end

#puts extract_uppercase("HELLO! LAURA!")