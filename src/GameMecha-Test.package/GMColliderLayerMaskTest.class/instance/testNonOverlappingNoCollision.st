test cases
testNonOverlappingNoCollision
	
	morphB position: morphA position + (200 @ 200).
	self assertCollisionInManager: morphA with: morphB equals: false