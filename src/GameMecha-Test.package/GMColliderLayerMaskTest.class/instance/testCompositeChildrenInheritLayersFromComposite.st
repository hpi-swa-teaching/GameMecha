test cases
testCompositeChildrenInheritLayersFromComposite

	| composite target |
	composite := self morphWithCompositeOnLayer: #(1) withMask: #(1).
	target := self morphOnLayer: #(1) withMask: #(1).
	target position: composite position.
	self assertCollision: composite with: target equals: true