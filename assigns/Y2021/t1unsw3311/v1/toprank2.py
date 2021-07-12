import sqlite3, sys

if len(sys.argv) < 2:
    print("Usage:", sys.argv[0], "Genres MinRating")
    sys.exit(1)