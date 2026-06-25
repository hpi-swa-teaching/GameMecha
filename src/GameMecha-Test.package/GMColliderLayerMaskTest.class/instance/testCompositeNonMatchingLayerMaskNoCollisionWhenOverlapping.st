running
testCompositeNonMatchingLayerMaskNoCollisionWhenOverlapping

	| composite target |
	composite := self morphWithCompositeOnLayer: #(1) withMask: #(2).
	target := self morphOnLayer: #(3) withMask: #(3).
	target position: composite position.
	self assertCollision: composite with: target equals: false