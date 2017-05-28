containing
containsRect: aRect
	^ (self bounds containsRect: aRect bounds)
		and: [self containsPoint: aRect bounds origin]
		and: [self containsPoint: aRect bounds corner].