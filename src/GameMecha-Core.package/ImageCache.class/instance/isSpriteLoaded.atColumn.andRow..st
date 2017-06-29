as yet unclassified
isSpriteLoaded: aPath atColumn: column andRow: row
	^ (self getSpriteSheet: aPath)
		isSpriteLoadedAtColumn: column andRow: row.