fileHandling
getTileMapFromProjectName: aName withPath: aPath
	"Loads a tileMap from the git asset browser"
	Smalltalk at: #GitAssetLoader
		ifAbsent: [self error: 'Squot Mapper GitAssetLoader not available'.
			^ self].
	^ GMTEEditor getTileMapFromFileBinary: (((Smalltalk at: #GitAssetLoader) for: aName) loadAsset: aPath)