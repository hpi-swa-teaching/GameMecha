layerTests
testRenameLayer
	"tests the renaming of layers"
	
	self editor tileMap tileMatrixStack setLayerNameOf: self editor getSelectedLayer to: 'testName'.
	self assert: ((self editor tileMap tileMatrixStack layerNameOf: 1) literalEqual: 'testName')