asserting
validIndex: aPoint

	(aPoint y between: 1 and: self rowCount) ifFalse: [^false].
	(aPoint x between: 1 and: self columnCount) ifFalse: [^false].
	^ true