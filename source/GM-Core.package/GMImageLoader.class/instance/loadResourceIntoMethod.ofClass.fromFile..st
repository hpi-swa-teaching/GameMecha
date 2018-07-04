as yet unclassified
loadResourceIntoMethod: aMethodSymbol ofClass: aClass fromFile: aFilename 
	| stream |
	stream := (WriteStream on: '') 
		nextPutAll: (aMethodSymbol asString , String cr , '"This is an auto-generated method"', String cr, ' ^ ');
		yourself.
	(self loadResourceFromDrive: aFilename) storeOn: stream.
	aClass class compile: stream contents.