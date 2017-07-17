containing
containsRect: aRectangleBehavior
	^ (self bounds containsRect: aRectangleBehavior target bounds)
		and: [self containsPoint: aRectangleBehavior target bounds origin]
		and: [self containsPoint: aRectangleBehavior target bounds corner].