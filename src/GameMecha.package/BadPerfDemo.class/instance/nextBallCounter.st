accessing
nextBallCounter
	nextBallCounter ifNil: [self nextBallCounter: 0].
	^ nextBallCounter