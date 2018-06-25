event Input
keyboardFocusChange: aBoolean fromMorph: aMorph
	aBoolean ifFalse: [self pressedKeys: Set new].