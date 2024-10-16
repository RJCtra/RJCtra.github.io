# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

The benefits of the random partitioning approach would be that due to the observations being collected on three boats, a single boat would not be overwhelmed with too much data, it would also offer a layer of redundancy in case something happens to one of the boats and / or communications which prevents access (either viewing or recording) to that boat's stored data. The downside to using random partitioning is that there is no way to know where a specific observation will be stored, so all three boats would need to be queried for each observation.

## Partitioning by Hour

The benefits of partitioning by the hour are that it will be known exactly which boat observations for a given time will be, this will mean that accessing specific records will only involve querying one boat, unless the observations are on either side of the cutoff hours. The main downside is that as most observations are made in a specific time period, there will be a chance that one boat will fill all of its data storage. There is also a danger that if something happens with data access / to a boat, then there will be no redundancy for records for that period. It is possible that a boat will store few or no observations, which would be a poor use of resources.

## Partitioning by Hash Value

The benefits of partitioning by hash value is that all boat resources will be used effectively, it will be known exactly where specific observations will be stored, making querying the data very intuitive. Due to the same hash value being assigned to the same timestamp, it is easy to compare observations from day to day. There is an added layer of redundancy due to the records being shared across the boats. Also, the disadvantage of having to conduct queries across all boats if querying a period of time, as opposed to a single time, is somewhat limited by knowing exactly what hash values need to be accessed. 
