as yet unclassified
storeEncodedFileInMethod: aMethodSymbol inInstance: anInstance fromFile: aFilename
	| stream |
	stream := (WriteStream on: '') 
		nextPutAll: aMethodSymbol asString , String cr , '"This is an auto-generated method."', String cr;
		nextPutAll: ' ^ ';
		store: (self contentsFromFile: aFilename);
		yourself.
	anInstance class compile: stream contents.