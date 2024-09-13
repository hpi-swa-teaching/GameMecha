comparing
inBounds: aPos

	(aPos x > self columnCount or: [aPos x < 1]) ifTrue: [^ false].
	(aPos y > self rowCount or: [aPos y < 1]) ifTrue: [^ false].
	^ true