drawing
drawOn: aCanvas

	| inner |
	inner := self bounds insetBy: 8.
	aCanvas
		fillRectangle: inner color: self currentColor;
		frameRectangle: inner color: self borderColor