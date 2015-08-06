Exercise Data Format (EDF) Fields
=================================


These are the currently defined fields (total of 9) for the [Exercise Data Format (EDF)](./):

GSR
----------

**Galvanic Skin Response**: measured in microsiemens


HR
----------

**Heartrate**: measured in beats per minute


alt
----------

**Altitude**: altitude above sea level in meters


atemp
----------

**Air Temperature**: measured in Celsius


lat
----------

**Latitude**: [WGS84](http://en.wikipedia.org/wiki/World_Geodetic_System#A_new_World_Geodetic_System:_WGS_84) in decimal notation


lon
----------

**Longitude**: [WGS84](http://en.wikipedia.org/wiki/World_Geodetic_System#A_new_World_Geodetic_System:_WGS_84) in decimal notation


stemp
----------

**Skin Temperature**: measured in Celsius


steps
----------

**Steps**: measured in steps taken during a given time period


time
----------

**Timestamp**: [Internet Timestamps (RFC 3339)](https://tools.ietf.org/html/rfc3339)


Note: [draft-jennings-core-senml](https://tools.ietf.org/html/draft-jennings-core-senml#section-11.1) defines a set of units for any kind of values. It would be conceivable to apply such a framework in order to allow and use existing unit identifiers. However, this would complicate consumption and might introduce risks, because implementations might not always interpret unit identifiers and convert values accordingly.
