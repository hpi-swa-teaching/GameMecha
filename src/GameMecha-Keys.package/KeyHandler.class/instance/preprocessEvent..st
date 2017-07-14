keyHandling
preprocessEvent: aEvent
	aEvent anyModifierKeyPressed ifTrue: [^ self getModifierKey: aEvent].
	^ self class preprocessChar: (self makePlatformIndependent: aEvent keyCharacter).