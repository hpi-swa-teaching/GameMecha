accessing
spriteBoundsAtRow: row andAtColumn: column
	|spriteSize|
	spriteSize := self getSpriteSheet extent / (self columns @ self rows).
	^((column@row) - 1) * spriteSize extent: spriteSize.