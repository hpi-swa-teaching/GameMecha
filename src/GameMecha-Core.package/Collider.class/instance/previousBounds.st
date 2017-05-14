accessing
previousBounds
	previousBounds ifNil: [self previousBounds: self bounds].
	^ previousBounds.