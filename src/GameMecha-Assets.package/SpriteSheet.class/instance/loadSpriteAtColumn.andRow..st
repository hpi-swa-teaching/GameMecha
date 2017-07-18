accessing
loadSpriteAtColumn: column andRow: row
	^self getPartWithBounds: (self spriteBoundsAtColumn: column andRow: row).