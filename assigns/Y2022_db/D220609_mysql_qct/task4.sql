-- Question 1 – 2 marks
-- Working as a Database Administrator for the MySQL Treasure Hunter database, write the following
-- commands for two employees namely Catie and Manav to achieve the following database security
-- requirements:
-- A. User Catie is no longer allowed to add data to the Player table (0.25 marks)
-- B. User Catie is no longer allowed to delete records from the Player table (0.25 marks)
-- C. User Manav must be able to add records to the Quest table (0.25 marks)
-- D. User Manav must be able to remove records from the Quest table (0.25 marks)
-- Assume usernames of employees namely Catie and Manav are catie and manav respectively.

revoke insert on player from catie;

revoke delete on player from catie;

grant add on quest to manav;

grant delete on quest to manav;

