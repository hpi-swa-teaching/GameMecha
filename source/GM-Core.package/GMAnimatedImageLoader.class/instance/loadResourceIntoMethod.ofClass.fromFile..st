as yet unclassified
loadResourceIntoMethod: aMethodSymbol ofClass: aClass fromFile: aFilename
	| stream |
	stream := (WriteStream on: '') 
		nextPutAll: aMethodSymbol asString , String cr , '"This is an auto-generated method."', String cr;
		nextPutAll: ' ^ AnimatedGIFReadWriter formsFromStream: (ReadStream on: ';
		store: (self contentsFromFile: aFilename);
		nextPutAll: ' base64Decoded asByteArray)';
		yourself.
	aClass class compile: stream contents.