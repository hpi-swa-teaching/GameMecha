as yet unclassified
intersectsCircle: otherCircle
	|myRadius otherRadius myCenter otherCenter squaredDistance|
	myRadius := (self bounds width min: self bounds height) / 2.
	otherRadius := (otherCircle bounds width min: otherCircle bounds height) / 2.
	
	myCenter := self bounds center.
	otherCenter := otherCircle bounds center.
	
	squaredDistance := myCenter squaredDistanceTo: otherCenter.
	
	^ squaredDistance <= (myRadius + otherRadius) squared.