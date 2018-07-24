collision
areCorners: aCornerCollection intersectingWith: anotherCornerCollection onSeparatingAxes: axes
	^ axes noneSatisfy: [:axis |
		| ourProjectedCorners otherProjectedCorners |
		ourProjectedCorners := aCornerCollection collect: [:corner | corner dotProduct: axis].
		otherProjectedCorners := anotherCornerCollection collect: [:corner | corner dotProduct: axis].
		ourProjectedCorners max <= otherProjectedCorners min or:
		[ourProjectedCorners min >= otherProjectedCorners max]]