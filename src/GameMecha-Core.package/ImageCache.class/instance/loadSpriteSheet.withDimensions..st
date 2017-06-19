io
loadSpriteSheet: aPath withDimensions: sheetDimensions
	"return a spriteSheet with its sprites as textureForms"
	| sprites |
	sprites := Dictionary new.
	sprites at: (self class pathToCollection: aPath)  put: (self loadElement: aPath).
	1 to: sheetDimensions y do:
		[:i  | 1 to: sheetDimensions x do:
			[:o | sprites at: (self class pathToCollection:(aPath,'_',i,'_',o) )  put: (self loadSingleSpriteAtPosition: i@o fromSheet: (sprites at: (self class pathToCollection:aPath)) withDimensions: sheetDimensions)]].
	self cachedElements addAll: sprites.