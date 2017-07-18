as yet unclassified
fromSpriteSheet: aPath withDimensions: dimensions
	^ self new
		spriteSheet: (SpriteSheet fromFile: aPath withDimensions: dimensions);
		startIndex: 1;
		endIndex: dimensions area;
		yourself.