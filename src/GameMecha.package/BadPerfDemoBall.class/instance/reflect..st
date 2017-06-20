as yet unclassified
reflect: collisionEvent
	|other|
	other := collisionEvent collisionPartnerOf: self.
	other isBall
		ifTrue: [self reflectCircular: other]
		ifFalse: [self randomDirection.].