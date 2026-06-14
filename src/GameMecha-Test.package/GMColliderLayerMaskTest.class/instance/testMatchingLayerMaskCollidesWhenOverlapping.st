test cases
testMatchingLayerMaskCollidesWhenOverlapping
	
	morphB position: morphA position.
	self assertCollisionInManager: morphA with: morphB equals: true