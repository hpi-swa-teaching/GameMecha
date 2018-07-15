as yet unclassified
move: aFactor
	self owner center: self owner center + (self velocity * aFactor).
	self owner angle: self owner angle + (GMCollisionPerformanceTestEntity rotationSpeed * aFactor).