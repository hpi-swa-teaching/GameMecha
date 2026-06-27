test cases
testNonOverlappingNoCollision

	self morphB position: self morphA position + (200 @ 200).
	self assertCollisionInManager: self morphA with: self morphB equals: false