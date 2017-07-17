accessing
pressedKeys
	pressedKeys ifNil: [self pressedKeys: Set new].
	^ pressedKeys.