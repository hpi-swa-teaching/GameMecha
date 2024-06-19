as yet unclassified
testRenameLayer

	self editor layerList at: self editor selectedLayer put: 'testName'.
	self assert: ((self editor layerList at: 1) literalEqual: 'testName')