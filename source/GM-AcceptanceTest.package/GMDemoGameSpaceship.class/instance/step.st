stepping and presenter
step
	(self isKeyPressed: $a) ifTrue: [self turnLeft].
	(self isKeyPressed: $d) ifTrue: [self turnRight].
	(self isKeyPressed: $w) ifTrue: [self accelerate].
	(self isKeyPressed: $s) ifTrue: [self shoot].
	self move.
	self isOutOfGame ifTrue: [self kill]. 