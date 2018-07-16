playing sounds
playMusic: aString
	self currentMusic: (RepeatingSound repeatForever: (self at: aString)).
	self currentMusic play.