test cases
testCircleCircleNoCollision

	self
		denyCollision: self smallCircleMorph
		with: self bigCircleMorph
		andOffset: self class smallCircleRadius + self class bigCircleRadius + 1 @ 0

