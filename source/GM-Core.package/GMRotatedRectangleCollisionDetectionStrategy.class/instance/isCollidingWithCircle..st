collision
isCollidingWithCircle: aMorph
	| circleDistance rotatedCenter rectExtent |
	rotatedCenter := aMorph center rotateBy:  self owner angle negated about: self owner center.
	rectExtent := self originalRectangle extent * self owner scale.
	circleDistance := (rotatedCenter - self owner center) abs.
	circleDistance x > (rectExtent x / 2 + aMorph collisionDetectionStrategy radius) ifTrue: [^ false].
	circleDistance y > (rectExtent y / 2 + aMorph collisionDetectionStrategy radius) ifTrue: [^ false].
	circleDistance x <= (rectExtent x / 2) ifTrue: [^ true].
	circleDistance y <= (rectExtent y / 2) ifTrue: [^ true].
	"Because we calculated circleDistance we can now imagine the rectangle center in 0 @ 0, 
	the circle center at circleDistance and the rectangle corner at (aMorph extent)."
	^ (circleDistance squaredDistanceTo: rectExtent / 2) <= aMorph collisionDetectionStrategy radius squared