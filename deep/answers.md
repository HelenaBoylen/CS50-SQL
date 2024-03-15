# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

For:
The observations should be evenly distributed between the boats thus spreading the load and allowing more data to be stored without overloading any particular boat. It should theoretically be a simpler method of submitting data and therefore quicker.

Against:
Although evenly distributed and probably simpler to distribute, randomly spreading the data between three boats means that it is a more complex and longer task to retrieve that information as all three boats might have to be scanned. Also, if one of the boats is lost, there would be no way to know which chunks of data had been lost with it.

## Partitioning by Hour

For:
This method should make retrieving the data quicker as it would be known exactly where the data is stored. Therefore queries should be returned a bit quicker. If busy retrieval times are known, perhaps you could have larger servers on those time slots.

Against:
This method would make the distribution of data very uneven given that data tends to be concentrated at certain times. Would seem to defy the point of partitioning.

## Partitioning by Hash Value

For:
This method should combine the advantages of partitioning by hour and randomly in that it spreads the load evenly between the three boats BUT since each datetime hash is knowable, it's location is also knowable - so you only have to query one boat.

Against:
The disadvantage would be perhaps that hashing the values to ascertain which boat to send them to takes a bit longer than just "spraying" them up to the boat unhashed. Presumably retrieving the data would be slowed down marginally as the query would need to work out the hash value of a time to know which boat to query.

## Conclusion

Although partitioning by Hash Value might slow down the intial submittal and retrieval of data a tiny bit, I think that this is massively offset by the advantage of the combination of spreading the load evenly BUT also knowing which boat to query.
