test cases
testNonMatchingLayerMaskNoCollisionWhenOverlapping
	
	morphC position: morphA position.
	self assertCollisionInManager: morphA with: morphC equals: false