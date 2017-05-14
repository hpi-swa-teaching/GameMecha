as yet unclassified
registerCollisionHandler: aBlock
  "____  ____      __      __  ____  ______   ____
  |_   _| | /\  \   /   \     | |  |_  _| |  __   | | /\  \
    |  |   | \/ /  / /\  \   | |    |  |   | |_ |  | | \/ /
    |_|   |_/\_\ /_/  \ _\ |_|    |_|   |_____| |_/\_\"
	
	"register a block that should get executed on every collision with this object.
	Append it to other collisionHandlers that already exist."
	
	|oldHandler|
	oldHandler := self collisionHandler.
	
	self collisionHandler: [:eventObject | 
			oldHandler value: eventObject.
			aBlock value: eventObject].