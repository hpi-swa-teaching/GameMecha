as yet unclassified
playMusic: aString
	self currentMusic: (RepeatingSound repeatForever: (self sampledSound: aString)).
	self currentMusic play.