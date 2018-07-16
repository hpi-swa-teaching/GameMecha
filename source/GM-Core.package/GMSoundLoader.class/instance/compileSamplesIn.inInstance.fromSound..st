storing
compileSamplesIn: aSelector inInstance: anInstance fromSound: aSound
	self compileMethod: (aSelector asString , 'Samples') asSymbol inInstance: anInstance fromString: ((WriteStream on: '')
		store: (aSound samples asByteArray base64Encoded);
		nextPutAll: ' base64Decoded asByteArray';
		contents).