as yet unclassified
compileSamplesIn: aMethodSymbol ofClass: aClass fromSound: aSound
	| stream |
	stream := (WriteStream on: '') 
		nextPutAll: (aMethodSymbol asString , 'Samples', String cr , ' ^ ');
		yourself.
	aSound samples asByteArray base64Encoded storeOn: stream.
	stream nextPutAll: ' base64Decoded asByteArray'.
	aClass class compile: stream contents.