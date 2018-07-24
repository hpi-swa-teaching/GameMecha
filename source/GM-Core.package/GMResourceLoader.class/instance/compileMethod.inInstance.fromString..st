storing
compileMethod: aSelector inInstance: anInstance fromString: aString
	anInstance class compile: ((WriteStream on: '') 
		nextPutAll: aSelector asString;
		nextPutAll: String cr, String tab, '"This is an auto-generated method"';
		nextPutAll: String cr, String tab,  '^ ', aString;
		contents).