accessing
touchMargin
	touchMargin ifNil: [self touchMargin: 1].
	^ touchMargin.