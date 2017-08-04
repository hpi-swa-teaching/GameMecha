stepping and presenter
step
	super step.
	self nextBallCounter: self nextBallCounter + 1.
	(self nextBallCounter > 4)
		ifTrue: [
			self nextBallCounter: 0.
			self newBall].