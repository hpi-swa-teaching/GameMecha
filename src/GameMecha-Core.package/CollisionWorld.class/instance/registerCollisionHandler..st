as yet unclassified
registerCollisionHandler: aBlock
	"register a block that should get executed on every collision that occurs in this world"
	self collisionHandler: aBlock.