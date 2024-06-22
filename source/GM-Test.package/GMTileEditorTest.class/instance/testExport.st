layerTests
testExport

	self editor ifNil: [self setup].
	[self editor exportAsMorph] valueSupplyingAnswer: 'map.morph'.
	self assert: (FileDirectory default / 'map.morph') exists.
	self tearDown