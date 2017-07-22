as yet unclassified
fromSpriteSheet: aPath withColumns: columns andRows: rows
	^ self new
		spriteSheet: (SpriteSheet fromFile: aPath rows: rows columns: columns);
		startIndex: 1;
		endIndex: columns * rows;
		yourself.