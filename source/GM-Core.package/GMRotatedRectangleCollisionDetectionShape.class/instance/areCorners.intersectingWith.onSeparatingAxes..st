collision
areCorners: aCornerCollection intersectingWith: anotherCornerCollection onSeparatingAxes: axes
	axes do: [:axis |
		| ourProjectedCorners otherProjectedCorners |
		ourProjectedCorners := aCornerCollection collect: [:corner | corner dotProduct: axis].
		otherProjectedCorners := anotherCornerCollection collect: [:corner | corner dotProduct: axis].
		ourProjectedCorners max <= otherProjectedCorners min ifTrue: [^ false].
		ourProjectedCorners min >= otherProjectedCorners max ifTrue: [^ false]].
	^ true