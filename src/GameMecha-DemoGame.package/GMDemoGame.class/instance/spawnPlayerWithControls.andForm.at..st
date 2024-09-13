game logic
spawnPlayerWithControls: aDictionary andForm: aForm at: aPoint
	| aPlayer |
	aPlayer := (GMDemoGameSpaceship newFromGame: self)
		controls: aDictionary;
		image: aForm;
		yourself.
	aPlayer spatialMorph position: aPoint + self position.
	self players add: aPlayer.
	^ aPlayer
