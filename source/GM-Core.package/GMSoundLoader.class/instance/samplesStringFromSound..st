storing
samplesStringFromSound: aSound
	^ (WriteStream on: '')
		store: (aSound samples asByteArray base64Encoded);
		nextPutAll: ' base64Decoded asByteArray';
		contents