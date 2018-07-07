as yet unclassified
loadFileIntoMethod: aMethodSymbol ofClass: aClass fromFile: aFilename
	| stream |
	stream := (WriteStream on: '') 
		nextPutAll: aMethodSymbol asString , String cr , '"This is an auto-generated method."', String cr;
		nextPutAll: ' ^ ';
		store: (self contentsFromFile: aFilename);
		yourself.
	aClass class compile: stream contents.