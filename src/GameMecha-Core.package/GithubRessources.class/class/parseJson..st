as yet unclassified
parseJson: jsonString
| ret |
ret := Dictionary new.
ret addAll: (self parseJson: jsonString withSubdirCallback: [:url | Transcript show: url. ret addAll: (self parseJson: (self loadJson: url)).]).
^ ret.