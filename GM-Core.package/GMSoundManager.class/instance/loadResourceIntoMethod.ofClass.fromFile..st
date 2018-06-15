as yet unclassified
loadResourceIntoMethod: aMethodSymbol ofClass: aClass fromFile: aFilename
	| sound |
	"only supports WAV"
	sound := self loadResourceFromDrive: aFilename.
	self compileSamplesIn: aMethodSymbol ofClass: aClass fromSound: sound.
	self compileSampledSoundIn: aMethodSymbol ofClass: aClass fromSound: sound.