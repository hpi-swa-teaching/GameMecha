drawing
drawOn: aCanvas

	| inner |
	inner := self bounds insetBy: 8.
	aCanvas
		fillOval: inner color: self currentColor;
		frameOval: inner color: self borderColor