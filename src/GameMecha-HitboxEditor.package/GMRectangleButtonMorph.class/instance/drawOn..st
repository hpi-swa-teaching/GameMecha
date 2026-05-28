drawing
drawOn: aCanvas

	| b inner |
	b := self bounds.
	inner := b insetBy: 8.
	aCanvas fillRectangle: inner color: self currentColor.
	aCanvas frameRectangle: inner color: self currentColor