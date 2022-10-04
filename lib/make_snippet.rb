def make_snippet(string)
    listofwords = string.split(" ")
    numberofwords = listofwords.count()
    if numberofwords > 5
       firstfivewords = listofwords[0,5].join(" ")
       return firstfivewords + "..."
    else
        return string
    end
end
puts make_snippet("words word wordsss hello four more words")