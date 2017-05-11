as yet unclassified
intersectsRect: aRect
	"checks for circle-rect-intersection as described here:"
	"http://stackoverflow.com/questions/401847/circle-rectangle-collision-detection-intersection"
	
	|circleDistance radius|
	circleDistance := (self bounds center - aRect bounds center) abs.
	radius := (self bounds width min: self bounds height) / 2.
	
	((circleDistance x > (aRect bounds width / 2 + radius))
		or: [circleDistance y > (aRect bounds height / 2 + radius)] )
		ifTrue: [^ false].
		
	((circleDistance x <= (aRect bounds width / 2))
		or: [circleDistance y <= (aRect bounds height / 2)] )
		ifTrue: [^ true].
		
	^ (circleDistance squaredDistanceTo: (aRect bounds extent / 2)) <= radius squared.
	
	