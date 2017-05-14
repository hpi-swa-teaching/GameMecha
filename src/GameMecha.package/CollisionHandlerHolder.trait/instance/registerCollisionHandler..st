trading
registerCollisionHandler: aBlock
  "____  ____      __      __  ____  ______   ____
  |_   _| | /\  \   /   \     | |  |_  _| |  __   | | /\  \ DO NOT CHANGE ANYTHING IF YOU DON'T KNOW WHAT YOU ARE DOING
    |  |   | \/ /  / /\  \   | |    |  |   | |_ |  | | \/ / IF YOU REALLY WANT TO CHANGE ANYTHING, CHANGE IT IN THE TRAIT CLASS
    |_|   |_/\_\ /_/  \ _\ |_|    |_|   |_____| |_/\_\"
	
	"register a block that should get executed on every collision with this object.
	Append it to other collisionHandlers that already exist."
	
	|oldHandler|
	oldHandler := self collisionHandler.
	
	self collisionHandler: [:eventObject | 
			oldHandler value: eventObject.
			aBlock value: eventObject].