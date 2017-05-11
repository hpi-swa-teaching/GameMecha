collision
registerCollisionHandler: aBlock
	"register a block that should get executed on every collision with this object"
	self collisionHandler: aBlock.