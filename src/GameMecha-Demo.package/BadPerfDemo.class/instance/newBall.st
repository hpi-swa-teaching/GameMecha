accessing
newBall
	self addCollider: (BadPerfDemoBall new
		randomPositionIn: self bounds;
		yourself).
	self ballCounter: self ballCounter + 1.
	Transcript show: (self ballCounter).
	Transcript show: '   '.