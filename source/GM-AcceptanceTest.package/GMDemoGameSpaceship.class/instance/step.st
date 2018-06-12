stepping and presenter
step
	super step.
	self reduceCooldownCounter.
	(self isKeyPressed: (self controls at: #leftKey)) ifTrue: [self turnLeft].
	(self isKeyPressed: (self controls at: #rightKey)) ifTrue: [self turnRight].
	(self isKeyPressed: (self controls at: #upKey)) ifTrue: [self accelerate].
	(self isKeyPressed: (self controls at: #downKey)) ifTrue: [self tryShooting].