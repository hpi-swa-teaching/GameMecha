accessing
spriteBoundsAtColumn: column andRow: row
	|spriteSize|
	spriteSize := self getSpriteSheet extent / (self columns @ self rows).
	^((column@row) - 1) * spriteSize extent: spriteSize.