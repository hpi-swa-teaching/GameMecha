as yet unclassified
storeEncodedFileInMethod: aSelector inInstance: anInstance fromFile: aFilename
	| stream |
	stream := (WriteStream on: '') 
		nextPutAll: aSelector asString , String cr , '"This is an auto-generated method."', String cr;
		nextPutAll: ' ^ ';
		store: (self contentsFromFile: aFilename);
		yourself.
	anInstance class compile: stream contents.