test cases
testCompositeWithMultipleLayersCollidesWhenOneMaskMatches

	| composite target |
	composite := self morphWithCompositeOnLayer: #(1 2) withMask: #(3).
	target := self morphOnLayer: #(3) withMask: #(1).
	target position: composite position.
	self assertCollision: composite with: target equals: true