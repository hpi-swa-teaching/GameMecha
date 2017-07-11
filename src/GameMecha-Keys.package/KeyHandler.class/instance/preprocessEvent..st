keyHandling
preprocessEvent: aEvent
	aEvent anyModifierKeyPressed ifTrue: [^ self getModifierKey: aEvent].
	^ self preprocessChar: (self makePlatformIndependent: aEvent keyCharacter).