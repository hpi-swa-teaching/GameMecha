accessing
keyMorph
	^ keyMorph ifNil: [keyMorph := Morph new
		gmRegisterToKeyHandler;
		yourself]