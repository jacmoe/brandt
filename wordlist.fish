#! /usr/bin/fish

# Script uses IPA database with 125,000 words, downloaded from https://github.com/menelik3/cmudict-ipa

awk '
    FNR == NR {
      # reading file1
      words[$0] = $0
      next
    }
    {
      # reading file2
      for (elem in words)
        if (tolower($1) == elem)
          if (values[elem] == "") {
            values[elem] = tolower($0)
          }
          else
            values[elem] = tolower($0)
        if (not tolower($1) == values[elem])
            values[elem] = elem " ***NOT FOUND***"
    }
    END {
      for (elem in values)
        print values[elem]
    }
' ./words.txt ~/sources/cmudict-ipa/cmudict-0.7b-ipa.txt | tee words_processed.txt
