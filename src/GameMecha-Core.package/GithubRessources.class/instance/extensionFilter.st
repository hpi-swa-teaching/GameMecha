accessing
extensionFilter
	extensionFilter isNil ifTrue: [extensionFilter := '.*'].
	^ extensionFilter.