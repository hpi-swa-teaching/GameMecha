as yet unclassified
intersectsCircle: otherCircle
	"check, if the distance between the two center points is smaller than their sum of radii"
	|myRadius otherRadius myCenter otherCenter squaredDistance|
	myRadius := (self bounds width min: self bounds height) / 2.
	otherRadius := (otherCircle bounds width min: otherCircle bounds height) / 2.
	
	myCenter := self bounds center.
	otherCenter := otherCircle bounds center.
	
	squaredDistance := myCenter squaredDistanceTo: otherCenter.
	
	^ squaredDistance <= (myRadius + otherRadius) squared.