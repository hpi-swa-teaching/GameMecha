as yet unclassified
testRenameLayer
	"tests the renaming of layers"
	
	self editor updateLayerNameOf: self editor getSelectedLayer to: 'testName'.
	self assert: ((self editor getLayerList at: 1) literalEqual: 'testName (v)')