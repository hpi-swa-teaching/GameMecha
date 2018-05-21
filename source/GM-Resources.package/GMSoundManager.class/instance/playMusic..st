as yet unclassified
playMusic: aString
	self currentMusic ifNotNil: [self currentMusic pause].
	self currentMusic: (RepeatingSound repeatForever: (self sampledSound: aString)).
	self currentMusic play.