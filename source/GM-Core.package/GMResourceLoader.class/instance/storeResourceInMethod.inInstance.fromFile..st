storing
storeResourceInMethod: aSelector inInstance: anInstance fromFile: aFilename
	self compileMethod: aSelector 
		inInstance: anInstance
		fromString: (self stringFromFile: aFilename).