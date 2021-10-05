# Baseball Database Overview

There's a lot here, as it covers more than 150 years of baseball history in the United States. During that time, leagues and teams have changed a good deal, but the historical data is still there.

Start with the `master` table, which contains information about every person in the database. All people can be referenced by a `playerid` and should exist in the `master` table. That includes both players and managers. In baseball, many managers used to be players, which is something to keep in mind. There is also a `teams.plyrmgr` field. That field reflects whether, in the given year, the individual who managed the team was also a player on that team.

Regular statistics can be found in tables like `batting`, `fielding`, and `pitching`. There are also "post-season" versions of each. For the purposes of this assignment, focus on the regular ones.

Players may play multiple "stints" in a given season. For example, PlayerA might start the season with Team 1 and play a few weeks (stint 1). Then he might get injured and stop playing for a few weeks before returning to play for a few more weeks with Team 1 (stint 2). Then he might get traded to Team 2 and play the rest of the season with them (stint 3).

Teams in the United States are privately owned businesses (franchises). As such, they might move around the country for a variety of reasons, and re-brand themselves in the process. It's even possible for another franchise to pick up the same name that used to apply to a different franchise. `franchid` is consistent over time to apply to a single organization.

This database unfortunately lacks any referential integrity (foreign key) constraints, and that can make it somewhat more difficult to follow. However, in general, fields that have the same name across different tables (`playerid`, `yearid`, `teamid`, etc.) can be assumed to refer to each other (i.e., natural joins can work well).

Similarly, the choice of datatypes isn't always helpful. For example, many fields whose values are essentially boolean actually use `varchar` (like `teams.divwin`). It will be helpful to do some queries and examine the results to determine what values exist in certain columns, for example:

```postgresql
SELECT DISTINCT lgid FROM teams;

SELECT DISTINCT round FROM seriespost;
```

## Docker

The database repository includes a Dockerfile. **There is no requirement to use Docker in any way for this, or any other assignment in this class**. If you're already familiar with Docker, you may find it helpful to use, so it's available. If you're not familiar with Docker, just ignore it.