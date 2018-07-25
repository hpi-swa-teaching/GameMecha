collision
isCollidingWithRectangle: aMorph
	(self canIntersectRectangle: aMorph)
		ifFalse: [^ false].
	(self mustIntersectRectangle: aMorph)
		ifTrue: [^ true].
	^ self isIntersectingWithRectangle: aMorph