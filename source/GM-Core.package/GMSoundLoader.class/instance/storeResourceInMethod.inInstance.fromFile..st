as yet unclassified
storeResourceInMethod: aMethodSymbol inInstance: anInstance fromFile: aFilename
	| sound |
	"only supports WAV"
	sound := self resourceFromDrive: aFilename.
	self compileSamplesIn: aMethodSymbol inInstance: anInstance fromSound: sound.
	self compileSampledSoundIn: aMethodSymbol inInstance: anInstance fromSound: sound.