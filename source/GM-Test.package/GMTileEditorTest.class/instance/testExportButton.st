layerTests
testExportButton
	
	[self editor exportAsMorph] valueSupplyingAnswer: 'map.morph'.
	self assert: (FileDirectory default / 'map.morph') exists