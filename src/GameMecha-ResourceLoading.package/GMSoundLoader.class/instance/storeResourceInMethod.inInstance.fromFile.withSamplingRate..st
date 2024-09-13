storing
storeResourceInMethod: aSelector inInstance: anInstance fromFile: aFilename withSamplingRate: aNumber
	"meta-programming warning
	 only supports WAV, overwritten because we need multiple methods"
	| sound |
	sound := self resourceFromDrive: aFilename.
	self compileMethod: (self samplesMethodName: aSelector)
		inInstance: anInstance 
		fromString: (self samplesStringFromSound: sound).
	self compileMethod: aSelector 
		inInstance: anInstance 
		fromString: (self sampledSoundStringFromSound: sound 
			withSamplesIn: (self samplesMethodName: aSelector)
			andSamplingRate: aNumber).
