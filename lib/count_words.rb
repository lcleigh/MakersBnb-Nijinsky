# A method called count_words that takes a string as an argument and returns 
# he number of words in that string.

def count_words(string)
    words = string.split(" ")
    wordcount = words.count
    return wordcount
end

puts count_words("hello my name is bob")