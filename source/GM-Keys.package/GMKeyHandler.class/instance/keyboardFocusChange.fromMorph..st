event Input
keyboardFocusChange: aBoolean fromMorph: aMorph
	aBoolean ifFalse: [self pressedKeys: OrderedCollection new].
	^ self