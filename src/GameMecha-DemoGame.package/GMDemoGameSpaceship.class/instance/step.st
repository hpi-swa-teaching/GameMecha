stepping and presenter
step
	super step.
	self reduceCooldownCounter.
	(self gmIsKeyPressed: (self controls at: #leftKey)) ifTrue: [self turnLeft].
	(self gmIsKeyPressed: (self controls at: #rightKey)) ifTrue: [self turnRight].
	(self gmIsKeyPressed: (self controls at: #upKey)) ifTrue: [self accelerate].
	(self gmIsKeyPressed: (self controls at: #downKey)) ifTrue: [self tryShooting].