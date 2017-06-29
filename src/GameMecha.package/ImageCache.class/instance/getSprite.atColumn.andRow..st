io
getSprite: aPath atColumn: column andRow: row
	^ (self getSpriteSheet: aPath)
		getSpriteAtColumn: column andRow: row.