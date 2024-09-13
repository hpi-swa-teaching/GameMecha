instance creation
fromSprite: aSprite
	
	^ (self new)
		updateSprite: aSprite;
		yourself