as yet unclassified
compileMethod: aMethodSymbol inInstance: anInstance fromString: aString
	anInstance class compile: ((WriteStream on: '') 
		nextPutAll: (aMethodSymbol asString, String cr, String tab, '"This is an auto-generated method"', String cr, String tab,  '^ ');
		nextPutAll: aString;
		contents).