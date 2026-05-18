as yet unclassified
drawOn: aCanvas

	| b pad top left right |
	b := self bounds.
	pad := 8.
	top := b left + (b width / 2) @ (b top + pad).
	left := b left + pad @ (b bottom - pad).
	right := b right - pad @ (b bottom - pad).
	
	aCanvas
		drawPolygon: {top. left. right}
		color: self currentColor
		borderWidth: 0
		borderColor: Color transparent