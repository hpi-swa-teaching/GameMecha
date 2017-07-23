keyHandling
makePlatformIndependent: aCharacter
	| transformedCharacter |
	"make special adjustments to the character values for windows and mac"
	transformedCharacter := aCharacter.
	(Smalltalk platformName beginsWith: 'Win')
		ifTrue: [ 
			(aCharacter >= 96 and: [aCharacter <= 105])
				ifTrue: [ transformedCharacter := (aCharacter asciiValue - 48) asCharacter]
				ifFalse:[aCharacter isLowercase
						ifTrue: [ transformedCharacter := self class invalidCharacter]]].
	
	(Smalltalk platformName beginsWith: 'Mac')
		ifTrue: [
			transformedCharacter := self class macMapping at: aCharacter asInteger].
	^ transformedCharacter.