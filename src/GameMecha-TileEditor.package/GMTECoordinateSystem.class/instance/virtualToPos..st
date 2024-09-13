conversion
virtualToPos: aPoint
	"Translate point relativ to coordinate system origin to point relative to screen origin"

	| resultPoint |
	resultPoint := self origin + aPoint.
	self assert: [self containsPos: resultPoint] description: 'coordinate out of bounds'.
	^ resultPoint