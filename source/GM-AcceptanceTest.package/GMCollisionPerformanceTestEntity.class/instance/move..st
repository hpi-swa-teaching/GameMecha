as yet unclassified
move: signOfDirection
	self owner center: self owner center + (self velocity * signOfDirection).
	self owner angle: self owner angle + (GMCollisionPerformanceTestEntity rotationSpeed * signOfDirection).