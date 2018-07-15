as yet unclassified
compileMethod: aSelector inInstance: anInstance fromString: aString
	anInstance class compile: ((WriteStream on: '') 
		nextPutAll: (aSelector asString, String cr, String tab, '"This is an auto-generated method"', String cr, String tab,  '^ ');
		nextPutAll: aString;
		contents).