collision
isCollidingWithRectangle: aMorph
	| circleDistance |
	circleDistance := (self center - aMorph collisionDetectionStrategy center) abs.
	circleDistance x > (aMorph collisionDetectionStrategy fullBounds width / 2 + self radius) ifTrue: [^false].
	circleDistance y > (aMorph collisionDetectionStrategy fullBounds height / 2 + self radius) ifTrue: [^false].
	circleDistance x <= (aMorph collisionDetectionStrategy fullBounds width / 2) ifTrue: [^true].
	circleDistance y <= (aMorph collisionDetectionStrategy fullBounds height / 2) ifTrue: [^true].
	"Because we calculated circleDistance we can now imagine the rectangle center in 0 @ 0, 
	the circle center at circleDistance and the rectangle corner at (aMorph extent)."
	^ (circleDistance squaredDistanceTo: aMorph collisionDetectionStrategy fullBounds extent / 2) <= self radius squared.
	