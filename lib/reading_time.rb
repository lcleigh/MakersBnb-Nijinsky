#> As a user
#> so that I can manage my time
#> estimate of reading time for a test, assuming I can read 200 words a min

# reading_time
# takes one argument - text (string)
# returns the time take to read the given number of words - given 200 per min

def reading_time(text)
    
    text.delete!("!.,?")
    list_of_words = text.split(" ")
    number_of_words = list_of_words.count
    estimated_time = (number_of_words.to_f / 200)

    return "Estimated time: #{estimated_time} minutes"

end

#reading_time("The cat? Sat on the mat. Miaow said the Cat!")