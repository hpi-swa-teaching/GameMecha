stepping and presenter
step
	self move.
	self resolveCollisions.
	self isOutOfGame ifTrue: [self kill].