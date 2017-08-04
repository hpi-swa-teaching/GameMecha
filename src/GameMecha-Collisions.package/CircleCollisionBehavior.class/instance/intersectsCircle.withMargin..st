containing
intersectsCircle: otherCircleBehavior withMargin: tolerance
	"check, if the distance between the two center points is smaller than their sum of radii"
	
	|myRadius otherRadius myCenter otherCenter squaredDistance|
	
	myRadius := self radius + tolerance.
	otherRadius :=  otherCircleBehavior radius + tolerance.
	
	myCenter := self target bounds center.
	otherCenter :=  otherCircleBehavior target bounds center.
	
	squaredDistance := myCenter squaredDistanceTo: otherCenter.
	
	^ squaredDistance < (myRadius + otherRadius) squared.