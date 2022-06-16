# COMP9021 21T3 - Rachid Hamadi
# Final Exam Question 6

def statistics(filename):
    '''
    A text file, stored in the working directory, consists of sentences.
    A sentence consists of words, possibly directly followed by a comma,
    except for the last word which is directly followed by a full stop.
    Words are separated by spaces.

    >>> statistics('text_file_1.txt')
    There are 2 sentence(s).
    The shortest sentence has 31 word(s).
    The longest sentence has 34 word(s).
    The shortest word has 1 character(s).
    The longest word has 9 character(s).
    >>> statistics('text_file_2.txt')
    There are 4 sentence(s).
    The shortest sentence has 6 word(s).
    The longest sentence has 34 word(s).
    The shortest word has 1 character(s).
    The longest word has 12 character(s).
    >>> statistics('text_file_3.txt')
    There are 1 sentence(s).
    The shortest sentence has 30 word(s).
    The longest sentence has 30 word(s).
    The shortest word has 1 character(s).
    The longest word has 12 character(s).
    '''
    
    nb_of_sentences = None
    length_of_shortest_word = None
    length_of_longest_word = None
    min_nb_of_words_in_sentences = None
    max_nb_of_words_in_sentences = None

    import sys
    import re
    with open(filename) as file:
        f_content=file.read()
        sentences=f_content.split(".")
        nb_of_sentences=len(sentences)-1
        min=sys.maxsize
        max=0
        shotest = sys.maxsize
        longest = 0
        for sen in sentences[:-1]:
            sen=sen.replace("\n"," ").replace("\r"," ")
            sen=sen.replace(", "," ")
            sen=re.sub(' +',' ',sen)
            # print(sen)
            sen_splits=sen.strip().split(' ')
            len_sen=len(sen_splits)
            # for s in sen_splits:
            #     if s=='\n':
            #         len_sen+=1

            if len_sen>max:
                max=len_sen
            if len_sen<min:
                min=len_sen


            for w in sen_splits:
                if len(w)>=longest:
                    longest=len(w)
                if len(w)<=shotest:
                    shotest=len(w)

    min_nb_of_words_in_sentences=min
    max_nb_of_words_in_sentences=max
    length_of_longest_word=longest
    length_of_shortest_word=shotest

        # REPLACE pass ABOVE WITH YOUR CODE
    
    print('There are', nb_of_sentences, 'sentence(s).')
    print('The shortest sentence has', min_nb_of_words_in_sentences, 'word(s).')
    print('The longest sentence has', max_nb_of_words_in_sentences, 'word(s).')
    print('The shortest word has', length_of_shortest_word, 'character(s).')
    print('The longest word has', length_of_longest_word, 'character(s).')

if __name__ == '__main__':
    # import doctest
    # doctest.testmod()

    statistics('text_file_1.txt')