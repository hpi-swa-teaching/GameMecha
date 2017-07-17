containing
containsPoint: aPoint
	^ (self target bounds containsPoint: aPoint)
		and: [(self target bounds center squaredDistanceTo: aPoint) <= self radius squared].