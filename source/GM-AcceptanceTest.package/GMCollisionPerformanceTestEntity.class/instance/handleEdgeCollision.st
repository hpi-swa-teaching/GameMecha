as yet unclassified
handleEdgeCollision
	self owner right > self parentMorph right ifTrue: [self velocity: self velocity x negated @ self velocity y. self move.].
	self owner left < self parentMorph left ifTrue: [self velocity: self velocity x negated @ self velocity y. self move.].
	self owner top < self parentMorph top ifTrue: [self velocity: self velocity x @ self velocity y negated. self move.].
	self owner bottom > self parentMorph bottom ifTrue: [self velocity: self velocity x @ self velocity y negated. self move.].
	