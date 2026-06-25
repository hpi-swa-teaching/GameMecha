running
testCompositeNoCollisionWhenTargetOutOfRange

	| composite target |
	composite := self morphWithCompositeOnLayer: #(1) withMask: #(1).
	target := self morphOnLayer: #(1) withMask: #(1).
	target position: composite position + (500 @ 500).
	self assertCollision: composite with: target equals: false