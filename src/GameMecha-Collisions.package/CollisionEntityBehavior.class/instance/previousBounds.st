accessing
previousBounds
	previousBounds ifNil: [self previousBounds: self target bounds].
	^ previousBounds.