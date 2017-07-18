as yet unclassified
fromSpriteSheet: aPath on: aCache withColumns: columns andRows: rows
	aCache registerSpriteSheet: aPath withColumns: columns andRows: rows .
	
	^ self new
		spritePath: aPath;
		cache: aCache;
		startIndex: 1;
		endIndex: columns * rows;
		yourself.