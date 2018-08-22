collision
handleEdgeCollision
	(self owner right > self parent right or: [self owner left < self parent left])
		ifTrue: [self velocity: self velocity x negated @ self velocity y. self move].
	(self owner top < self parent top or: [self owner bottom > self parent bottom])
		ifTrue: [self velocity: self velocity x @ self velocity y negated. self move].
	