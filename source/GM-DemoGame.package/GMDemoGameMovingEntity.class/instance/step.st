stepping and presenter
step
	self 
		move;
		resolveCollisions.
	self isOutOfGame ifTrue: [self kill].