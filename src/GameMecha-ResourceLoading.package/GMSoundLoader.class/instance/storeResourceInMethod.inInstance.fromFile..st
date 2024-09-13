storing
storeResourceInMethod: aSelector inInstance: anInstance fromFile: aFilename
	"meta-programming warning
	 only supports WAV, overwritten because we need multiple methods"
	self storeResourceInMethod: aSelector inInstance: anInstance fromFile: aFilename withSamplingRate: 44100.
