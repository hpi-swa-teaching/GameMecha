accessing
registerCollisionHandler: aBlock
	|oldHandler|
	oldHandler := self collisionHandler.
	
	self collisionHandler: [:eventObject | 
			oldHandler value: eventObject.
			aBlock value: eventObject].