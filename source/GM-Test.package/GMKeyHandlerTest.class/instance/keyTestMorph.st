accessing
keyTestMorph
	^ keyTestMorph ifNil: [keyTestMorph := Morph new
		gmRegisterToKeyHandler;
		yourself]