storing
stringFromFile: aFilename
	^ (WriteStream on: '') 
		store: (self resourceFromDrive: aFilename);
		contents