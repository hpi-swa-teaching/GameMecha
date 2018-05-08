queryKey
isKeyPressed: aCharacter
	^ self keyPressedLookup at: aCharacter ifAbsent: [false]