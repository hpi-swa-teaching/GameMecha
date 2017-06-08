accessing
ballCounter
	ballCounter ifNil: [self ballCounter: 0].
	^ ballCounter.