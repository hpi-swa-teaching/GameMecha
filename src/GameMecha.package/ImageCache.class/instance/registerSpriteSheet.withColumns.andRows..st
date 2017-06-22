io
registerSpriteSheet: aPath withColumns: columns andRows: rows
	self cachedElements 
		at: (self class pathToCollection: aPath)
		ifAbsentPut: (SpriteSheet newOn: self resourceDirectory onSheet: aPath withRows: rows andColumns: columns).