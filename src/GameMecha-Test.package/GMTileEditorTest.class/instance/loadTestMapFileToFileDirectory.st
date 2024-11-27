helper
loadTestMapFileToFileDirectory
	"copies the test map file from the asset browser to the default FileDirectory for import tests"
	
	|tempFile|
	tempFile := FileDirectory default asFSReference / self fileUUID.
	tempFile writeStreamDo: [:stream | stream nextPutAll: (((Smalltalk at: #GitAssetLoader) for: 'GameMecha') loadAsset: '/testingResources/testMapFile.morph')]