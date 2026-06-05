game logic
handleInput

	self direction: 0 @ 0.
	(self gmIsKeyPressed: (self controls at: #leftKey)) ifTrue: [self direction: self direction - (1 @ 0)].
	(self gmIsKeyPressed: (self controls at: #rightKey)) ifTrue: [self direction:  self direction + (1 @ 0)].
	(self gmIsKeyPressed: (self controls at: #upKey)) ifTrue: [self direction: self direction - (0 @ 1)].
	(self gmIsKeyPressed: (self controls at: #downKey)) ifTrue: [self direction: self direction + (0 @ 1)].
	(self gmIsKeyPressed: (self controls at: #shootKey)) ifTrue: [self tryShoot]
	