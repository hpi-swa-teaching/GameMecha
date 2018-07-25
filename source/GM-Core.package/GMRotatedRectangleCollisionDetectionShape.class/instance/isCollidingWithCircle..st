collision
isCollidingWithCircle: aMorph
	(self canIntersectCircle: aMorph)
		ifFalse: [^ false].
	(self mustIntersectCircle: aMorph)
		ifTrue: [^ true].
	^ self isIntersectingWithCircle: aMorph