as yet unclassified
compileSamplesIn: aMethodSymbol inInstance: anInstance fromSound: aSound
	self compileMethod: (aMethodSymbol asString , 'Samples') asSymbol inInstance: anInstance fromString: ((WriteStream on: '')
		store: (aSound samples asByteArray base64Encoded);
		nextPutAll: ' base64Decoded asByteArray';
		contents).