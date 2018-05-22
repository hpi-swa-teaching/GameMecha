collision
isCollidingWithCircle: aMorph
	| circleDistance rotatedCenter originalRectFullBounds|
	rotatedCenter := aMorph collisionDetectionStrategy center rotateBy:  self owner angle negated about: self owner center.
	originalRectFullBounds := (self owner submorphs at: 0) fullBounds.
	circleDistance := (rotatedCenter - self owner center) abs.
	circleDistance x > (originalRectFullBounds width / 2 + aMorph collisionDetectionStrategy radius) ifTrue: [^false].
	circleDistance y > (originalRectFullBounds height / 2 + aMorph collisionDetectionStrategy radius) ifTrue: [^false].
	circleDistance x <= (originalRectFullBounds fullBounds width / 2) ifTrue: [^true].
	circleDistance y <= (originalRectFullBounds fullBounds height / 2) ifTrue: [^true].
	"Because we calculated circleDistance we can now imagine the rectangle center in 0 @ 0, 
	the circle center at circleDistance and the rectangle corner at (aMorph extent)."
	^ (circleDistance squaredDistanceTo: originalRectFullBounds extent / 2) <= aMorph collisionDetectionStrategy radius squared.