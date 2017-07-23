accessing
getSpriteAtColumn: column andRow: row
	^ self cachedElements 
		at: (column@row)
		ifAbsentPut: (self loadSpriteAtColumn: column andRow: row).