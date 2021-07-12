import sqlite3, sys

if len(sys.argv) < 3 or len(sys.argv) > 3:
    print("Usage:", sys.argv[0], "Genres", "MinRating")
    sys.exit(1)

if len(sys.argv) == 3:
    num_genres = sys.argv[1].split('&')
    minrating = float(sys.argv[2])

# print(num_genres)

# print(minrating)


con = sqlite3.connect('a2.db')

cur = con.cursor()

if num_genres is None or len(num_genres)==1:
    queryWithgenre = """select m.title, m.year, m.content_rating, m.lang, ra.imdb_score, ra.num_voted_users from movie m
            join genre ge on m.id = ge.movie_id
            join rating ra on m.id = ra.movie_id
            where ra.imdb_score >= {}
            group by m.id
            order by ra.imdb_score desc, ra.num_voted_users desc 
    """
    # print(queryWithgenre)
    cur.execute(queryWithgenre.format( minrating))
    n = 1
    while True:
        t = cur.fetchone()
        if t == None:
            break
        mTitle, mYear, mCon, mLang, mScore, mVoted = t
        if mCon != None and mYear!=None:
            print('{}. {} ({}, {}, {}) [{:.1f}, {}]'.format(n, mTitle, mYear, mCon, mLang, mScore, mVoted))
        elif mCon == None:
            print('{}. {} ({}, {}) [{:.1f}, {}]'.format(n, mTitle, mYear, mLang, mScore, mVoted))
        elif mYear== None:
            print('{}. {} ({}, {}) [{:.1f}, {}]'.format(n, mTitle, mCon, mLang, mScore, mVoted))
        n = n + 1
else:
    queryWithgenre = """select m.title, m.year, m.content_rating, m.lang, ra.imdb_score, ra.num_voted_users from movie m
                join genre ge on m.id = ge.movie_id
                join rating ra on m.id = ra.movie_id
                where ra.imdb_score >= {} and ge.genre={}
                group by m.id
        """
    intersect=" intersect "
    order=' order by ra.imdb_score desc, ra.num_voted_users desc '
    query=''
    for g in num_genres:
        if g==num_genres[-1]:
            query += queryWithgenre.format(minrating, "'"+g+"'")
        else:
            query+=queryWithgenre.format(minrating, "'"+g+"'")+intersect
    query+=order
    # print(query)
    cur.execute(query)
    n = 1
    while True:
        t = cur.fetchone()
        if t == None:
            break
        mTitle, mYear, mCon, mLang, mScore, mVoted = t
        if mCon != None and mYear!=None:
            print('{}. {} ({}, {}, {}) [{:.1f}, {}]'.format(n, mTitle, mYear, mCon, mLang, mScore, mVoted))
        elif mCon == None:
            print('{}. {} ({}, {}) [{:.1f}, {}]'.format(n, mTitle, mYear, mLang, mScore, mVoted))
        elif mYear== None:
            print('{}. {} ({}, {}) [{:.1f}, {}]'.format(n, mTitle, mCon, mLang, mScore, mVoted))
        n = n + 1


con.close()
