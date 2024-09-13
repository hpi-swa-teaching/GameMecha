storing
stringFromFile: aFilename
	^ (WriteStream on: '') 
		nextPutAll: ' GIFReadWriter formsFromStream: (ReadStream on: ';
		store: (self contentsFromFile: aFilename);
		nextPutAll: ' base64Decoded asByteArray)';
		contents