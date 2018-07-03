accessing
keyTestMorph
	^ keyTestMorph ifNil: [keyTestMorph := Morph new
		registerToKeyHandler;
		yourself]