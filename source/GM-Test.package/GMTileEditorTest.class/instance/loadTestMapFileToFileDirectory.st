as yet unclassified
loadTestMapFileToFileDirectory

	|tempFile|
	self fileUUID: UUID new asString.
	tempFile := FileDirectory default asFSReference / fileUUID.
	tempFile writeStreamDo: [:stream | stream nextPutAll: ((GitAssetLoader for: 'GameMecha') loadAsset: '/testMapFile.morph')]