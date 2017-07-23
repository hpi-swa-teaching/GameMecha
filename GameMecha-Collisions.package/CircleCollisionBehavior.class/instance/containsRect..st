containing
containsRect: aRectangleBehavior
	^ (self  target bounds containsRect: aRectangleBehavior target bounds)
		and: [self containsPoint: aRectangleBehavior target bounds origin]
		and: [self containsPoint: aRectangleBehavior target bounds corner].