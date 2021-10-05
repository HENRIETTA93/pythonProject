# Schema Normalization Notes

## Common Use-Cases

Things to look for that are often good candidates for normalization in a database schema:
- Location Data
    - An address, for example. Often city, state, zipcode is repeated
    - zipcode -> city, state, county
    - Decompose into two tables: 
        - Zipcode, city, state, county
        - Zipcode, everything else 
- Code/Description pairs 
    - Example: Motor Vehicle incidents: "accident type", "accident type description"
        - ("01", "Rear-end Collision"), ("02", "Collided with Traffic Sign")
    - Decompose into
        - Accident Type, Accident Type Description
        - Acciden Type, everything else

This is a bit trickier: multiple columns for different years:

CensusData(Location, men2010, women2010, men2011, women2011, ..., men2017, women2017)

This could become: (Location, men, women, year) or (location, gender, year)