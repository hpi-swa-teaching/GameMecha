storing
storeResourceInMethod: aSelector inInstance: anInstance fromFile: aFilename
	| sound |
	"only supports WAV"
	sound := self resourceFromDrive: aFilename.
	self compileSamplesIn: aSelector inInstance: anInstance fromSound: sound.
	self compileSampledSoundIn: aSelector inInstance: anInstance fromSound: sound.