test cases
testCollisionEventOfHasCorrectOwnAndOther

	| event |
	event := self collisionManager collisionEventOf: self morphA with: self morphB.
	self assert: event reason notNil.
	self assert: event own == self morphA.
	self assert: event other == self morphB