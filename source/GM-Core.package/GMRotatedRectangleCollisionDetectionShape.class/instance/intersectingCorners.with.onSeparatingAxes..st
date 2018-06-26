collision
intersectingCorners: corners with: otherCorners onSeparatingAxes: axes
	axes do: [:axis |
		| ourProjectedCorners otherProjectedCorners |
		ourProjectedCorners := corners collect: [:corner | corner dotProduct: axis].
		otherProjectedCorners := otherCorners collect: [:corner | corner dotProduct: axis].
		ourProjectedCorners max <= otherProjectedCorners min ifTrue: [^ false].
		ourProjectedCorners min >= otherProjectedCorners max ifTrue: [^ false]].
	^ true