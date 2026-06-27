test cases
testCompositeCollidesWhenTargetAtSecondChildPosition

	| composite target |
	composite := self morphWithCompositeOnLayer: #(1) withMask: #(1).
	target := self morphOnLayer: #(1) withMask: #(1).
	target position: 200 @ 0.
	self assertCollision: composite with: target equals: true