test cases
testMultipleLayersCollidesWhenOneMaskMatches

	| morphMultiLayer target |
	morphMultiLayer := self morphOnLayer: #(1 2) withMask: #(3).
	target := self morphOnLayer: #(3) withMask: #(1).
	target position: morphMultiLayer position.
	self assertCollision: morphMultiLayer with: target equals: true