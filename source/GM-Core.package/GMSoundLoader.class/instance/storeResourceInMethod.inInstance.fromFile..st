storing
storeResourceInMethod: aSelector inInstance: anInstance fromFile: aFilename
	| sound |
	"only supports WAV, overwritten because we need multiple methods"
	sound := self resourceFromDrive: aFilename.
	self compileMethod: (self samplesMethodName: aSelector)
		inInstance: anInstance 
		fromString: (self samplesStringFromSound: sound).
	self compileMethod: aSelector 
		inInstance: anInstance 
		fromString: (self sampledSoundStringFromSound: sound withSamplesIn: (self samplesMethodName: aSelector)).