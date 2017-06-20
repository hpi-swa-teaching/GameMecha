accessing
frameTime
	frameTime ifNil: [self frameTime: 100].
	^ frameTime.