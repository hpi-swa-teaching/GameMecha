utility
areCorners: aCornerCollection intersectingWith: anotherCornerCollection onSeparatingAxes: axes
	^ axes noneSatisfy: [:axis |
		self
			corners: (aCornerCollection collect: [:corner | corner dotProduct: axis]) 
			notOverlapping: (anotherCornerCollection collect: [:corner | corner dotProduct: axis])]