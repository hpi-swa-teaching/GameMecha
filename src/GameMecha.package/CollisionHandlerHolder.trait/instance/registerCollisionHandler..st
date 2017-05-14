as yet unclassified
registerCollisionHandler: aBlock
	"
	
	T R A I T   M E T H O D
	
	"
	
	"register a block that should get executed on every collision with this object.
	Append it to other collisionHandlers that already exist."
	
	|oldHandler|
	oldHandler := self collisionHandler.
	
	self collisionHandler: [:eventObject | 
			oldHandler value: eventObject.
			aBlock value: eventObject].