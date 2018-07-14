as yet unclassified
compileMethod: aMethodSymbol inInstance: anInstance fromString: aString
	anInstance class compile: ((WriteStream on: '') 
		nextPutAll: (aMethodSymbol asString, String cr , '"This is an auto-generated method"', String cr, ' ^ ');
		nextPutAll: aString;
		contents).