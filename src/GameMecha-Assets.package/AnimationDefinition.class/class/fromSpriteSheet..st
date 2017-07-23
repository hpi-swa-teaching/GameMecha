instance creation
fromSpriteSheet: spriteSheet
	^ self new
		spriteSheet: spriteSheet;
		startIndex: 1;
		endIndex: spriteSheet size;
		yourself.