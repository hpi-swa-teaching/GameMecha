layerTests
testExport
	"tests the export function" 
	
	[self editor exportAsMorph] valueSupplyingAnswer: self fileUUID.
	Transcript show: self fileUUID.
	self assert: (FileDirectory default / self fileUUID) exists.
	self tearDown