containing
intersectsRect: aRectangleBehavior withMargin: tolerance
	"checks for circle-rect-intersection as described here:"
	"http://stackoverflow.com/questions/401847/circle-rectangle-collision-detection-intersection"
	
	|circleDistance radius rectBounds|
	
	rectBounds := aRectangleBehavior target bounds expandBy: tolerance.
	circleDistance := (self target bounds center - rectBounds center) abs.
	radius := self radius + tolerance.
	
	((circleDistance x >= (rectBounds width / 2 + radius))
		or: [circleDistance y >= (rectBounds height / 2 + radius)] )
		ifTrue: [^ false].
		
	((circleDistance x <= (rectBounds width / 2))
		or: [circleDistance y <= (rectBounds height / 2)] )
		ifTrue: [^ true].
		
		
	^ (circleDistance dist: (rectBounds extent / 2)) <= radius.