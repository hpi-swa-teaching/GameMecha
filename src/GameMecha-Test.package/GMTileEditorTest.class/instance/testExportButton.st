editorTests
testExportButton
	"tests the export function"
	
	self fileUUID: UUID new asString.
	[self editor exportAsMorph] valueSupplyingAnswer: self fileUUID.
	self assert: (FileDirectory default / self fileUUID) exists