accessing
axes
	^ OrderedCollection newFrom: {
		(1 @ 0) rotateBy: self owner angle about: (0 @ 0).
		(0 @ 1) rotateBy: self owner angle about: (0 @ 0)}