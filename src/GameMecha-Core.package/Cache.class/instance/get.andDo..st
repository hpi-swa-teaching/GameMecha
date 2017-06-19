io
get: path andDo: aBlockClosure
	^ self cachedElements
		at: (self class pathToCollection: path)
		ifAbsent: [self insertIntoQueue: path andDo: aBlockClosure].