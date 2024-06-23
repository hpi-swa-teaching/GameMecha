layerTests
testExport
	"tests the export function" 
	
	self editor ifNil: [self setup].
	[self editor exportAsMorph] valueSupplyingAnswer: self fileUUID.
	self assert: (FileDirectory default / self fileUUID) exists.
	self tearDown