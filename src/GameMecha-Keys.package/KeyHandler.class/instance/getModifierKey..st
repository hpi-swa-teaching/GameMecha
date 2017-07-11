keyHandling
getModifierKey: aEvent	
	(Smalltalk platformName beginsWith: 'Win') ifTrue: [^aEvent keyCharacter asciiValue].
	Debugger halt.
	aEvent commandKeyPressed ifTrue: [^self class keyAlt].
	aEvent controlKeyPressed ifTrue: [^self class keyControl].
	aEvent shiftPressed ifTrue: [^self class keyShift].
	^self invalidCharacter.