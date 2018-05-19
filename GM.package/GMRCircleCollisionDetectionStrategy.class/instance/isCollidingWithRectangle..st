collision
isCollidingWithRectangle: aMorph
	|circleDistance|
	circleDistance := (self center - aMorph center) abs.
	circleDistance x > (aMorph extent x / 2 + self radius) ifTrue: [^false].
	circleDistance y > (aMorph extent y / 2 + self radius) ifTrue: [^false].
	circleDistance x <= (aMorph extent x / 2) ifTrue: [^true].
	circleDistance y <= (aMorph extent y / 2) ifTrue: [^true].
	"because we calculated circleDistance we can now imagine the rectangle center in 0 @ 0, 
	the circle center at circleDistance and the rectangle corner at (aMorph extent)."
	^ (circleDistance squaredDistanceTo: aMorph extent / 2) <= self radius squared.
	