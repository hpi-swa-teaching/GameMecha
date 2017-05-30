collision
intersectsCircle: otherCircle withMargin: tolerance
	"check, if the distance between the two center points is smaller than their sum of radii"
	
	|myRadius otherRadius myCenter otherCenter squaredDistance|
	
	myRadius := self radius + tolerance.
	otherRadius := otherCircle radius + tolerance.
	
	myCenter := self bounds center.
	otherCenter := otherCircle bounds center.
	
	squaredDistance := myCenter squaredDistanceTo: otherCenter.
	
	^ squaredDistance < (myRadius + otherRadius) squared.