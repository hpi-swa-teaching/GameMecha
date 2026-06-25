test cases
testCollisionEventOfHasCorrectOwnAndOther

	| event |
	event := self collisionManager collisionEventOf: morphA with: morphB.
	self assert: event reason notNil.
	self assert: event own == morphA.
	self assert: event other == morphB