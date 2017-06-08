io
getResourceAsStream: path
	^ self getResourceAsStream: path createIfAbsent: false.