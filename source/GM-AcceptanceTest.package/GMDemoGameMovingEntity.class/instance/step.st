stepping and presenter
step
	self move.
	self isOutOfGame ifTrue: [self kill]. 