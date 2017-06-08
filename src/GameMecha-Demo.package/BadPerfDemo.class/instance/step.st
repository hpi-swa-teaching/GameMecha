accessing
step
	super step.
	self nextBallCounter: self nextBallCounter + 1.
	(self nextBallCounter > 2)
		ifTrue: [
			self nextBallCounter: 0.
			self newBall].