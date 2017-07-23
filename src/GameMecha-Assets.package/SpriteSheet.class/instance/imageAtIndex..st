imageList
imageAtIndex: index
	^self imageAtCoordinates:
		((index - 1) \\ self columns + 1) @
		(((index - 1) / self columns) floor + 1).