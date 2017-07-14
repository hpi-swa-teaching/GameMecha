as yet unclassified
preprocessChar: aCharacter
	"filter a character from an event to map it back to keybaord buttons"	
	^ (self keyMap
			at: aCharacter
			ifAbsent: [aCharacter])
		asUppercase
		asciiValue.