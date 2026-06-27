test cases
testCompositeMatchingLayerMaskCollidesWhenOverlapping

	| composite target |
	composite := self morphWithCompositeOnLayer: #(1) withMask: #(2).
	target := self morphOnLayer: #(2) withMask: #(1).
	target position: composite position.
	self assertCollision: composite with: target equals: true