accessing
step
	super step.
	nextBallCtr := nextBallCtr + 1.
	(nextBallCtr > 50) ifTrue: [
		nextBallCtr := 0.
		self newBall.
		].