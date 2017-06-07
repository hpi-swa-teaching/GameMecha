accessing
newBall
	self addCollider: ((BadPerfDemoBall wrap: (CircleMorph new))
		position: ((Random new next)*((self width) - 10) + (self position x) + 10 @ 100);
		yourself).
		self ballCtr: (self ballCtr) +1.
		Transcript show: (self ballCtr).
		Transcript show: '   '.