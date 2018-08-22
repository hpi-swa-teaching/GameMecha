utility
corners: aCornerCollection notOverlapping: anotherCornerCollection
	^ aCornerCollection max <= anotherCornerCollection min or:
		[aCornerCollection min >= anotherCornerCollection max]