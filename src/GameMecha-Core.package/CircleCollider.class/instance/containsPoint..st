containing
containsPoint: aPoint
	^ (self bounds containsPoint: aPoint)
		and: [(self bounds center squaredDistanceTo: aPoint) <= self radius squared].