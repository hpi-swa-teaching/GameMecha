keyHandling
makePlatformIndependent: aCharacter
	| transformedCharacter |
	transformedCharacter := aCharacter.
	(Smalltalk platformName startsWith: 'Win')
		ifTrue: [ 
			(aCharacter >= 96 and: aCharacter <= 105)
				ifTrue: [ transformedCharacter := (aCharacter asciiValue - 48) asCharacter ].
			aCharacter isLowercase
				ifTrue: [ transformedCharacter := self class invalidCharacter ] ].
	Transcript showln: transformedCharacter asString , ' (was ' , aCharacter asString , ')'.
	^ transformedCharacter.