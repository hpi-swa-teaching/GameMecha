accessing
currentMusic
	^ currentMusic ifNil: [currentMusic := RepeatingSound new]