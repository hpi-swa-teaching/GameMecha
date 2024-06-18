as yet unclassified
loadTestMapFileToFileDirectory

	|tempFile|
	tempFile := FileDirectory default asFSReference / 'map.morph'.
	tempFile writeStreamDo: [:stream | stream nextPutAll: ((GitAssetLoader for: 'GameMecha') loadAsset: '/map.morph')]