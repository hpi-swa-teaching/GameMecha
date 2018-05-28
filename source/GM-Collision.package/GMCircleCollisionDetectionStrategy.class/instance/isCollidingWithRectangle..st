collision
isCollidingWithRectangle: aMorph
	| circleDistance |
	circleDistance := (self owner center - aMorph center) abs.
	circleDistance x > (aMorph fullBounds width / 2 + self radius) ifTrue: [^false].
	circleDistance y > (aMorph fullBounds height / 2 + self radius) ifTrue: [^false].
	circleDistance x <= (aMorph fullBounds width / 2) ifTrue: [^true].
	circleDistance y <= (aMorph fullBounds height / 2) ifTrue: [^true].
	"Because we calculated circleDistance we can now imagine the rectangle center in 0 @ 0, 
	the circle center at circleDistance and the rectangle corner at (aMorph extent)."
	^ (circleDistance squaredDistanceTo: aMorph fullBounds extent / 2) <= self radius squared.
	