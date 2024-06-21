as yet unclassified
testRenameLayer

	self editor updateLayerNameOf: self editor getSelectedLayer to: 'testName'.
	self assert: ((self editor getLayerList at: 1) literalEqual: 'testName (v)')