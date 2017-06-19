io
get: path andDo: aBlockClosure
	^ self cachedElements
		at: (self class pathToCollection: path)
		ifPresent: [:form | aBlockClosure value: form]
		ifAbsent: [self insertIntoQueue: path andDo: aBlockClosure].