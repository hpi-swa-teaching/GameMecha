test cases
testMultipleLayersNoCollisionWhenNoMaskMatches

	| morphMultiLayer target |
	morphMultiLayer := self morphOnLayer: #(1 2) withMask: #(3).
	target := self morphOnLayer: #(4) withMask: #(4).
	target position: morphMultiLayer position.
	self assertCollision: morphMultiLayer with: target equals: false