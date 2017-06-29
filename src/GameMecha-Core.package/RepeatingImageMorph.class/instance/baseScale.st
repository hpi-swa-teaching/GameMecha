accessing
baseScale
	baseScale ifNil: [self baseScale: 1].
	^ baseScale.