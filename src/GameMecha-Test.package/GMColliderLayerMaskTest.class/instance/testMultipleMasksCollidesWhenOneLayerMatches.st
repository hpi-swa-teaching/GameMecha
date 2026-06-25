running
testMultipleMasksCollidesWhenOneLayerMatches

	| morphMultiMask target |
	morphMultiMask := self morphOnLayer: #(3) withMask: #(1 2).
	target := self morphOnLayer: #(2) withMask: #(3).
	target position: morphMultiMask position.
	self assertCollision: morphMultiMask with: target equals: true