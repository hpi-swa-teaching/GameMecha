accessing
cachedElements
	cachedElements ifNil: [self cachedElements: Dictionary new].
	^ cachedElements