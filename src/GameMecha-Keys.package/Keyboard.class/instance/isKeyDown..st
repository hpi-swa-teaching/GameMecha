as yet unclassified
isKeyDown: aCharacter
	| key |
	key := aCharacter asCharacter asUppercase asciiValue.
	^ pressedKeys includes: key.