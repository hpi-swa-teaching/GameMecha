fileHandling
getTileMapFromProjectName: aName withPath: aPath
	"Loads a tileMap from the git asset browser"
	
    ^ GMTEEditor getTileMapFromFileBinary: ((GitAssetLoader for: aName) loadAsset: aPath)