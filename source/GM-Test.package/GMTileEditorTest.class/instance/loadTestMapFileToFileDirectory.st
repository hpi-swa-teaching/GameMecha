as yet unclassified
loadTestMapFileToFileDirectory
	"copies the test map file from the asset browser to the default FileDirectory for import tests"
	
	|tempFile|
	self fileUUID: UUID new asString.
	tempFile := FileDirectory default asFSReference / fileUUID.
	tempFile writeStreamDo: [:stream | stream nextPutAll: ((GitAssetLoader for: 'GameMecha') loadAsset: '/testMapFile.morph')]