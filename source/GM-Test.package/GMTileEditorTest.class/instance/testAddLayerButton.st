layerTests
testAddLayerButton
	"tests the addLayer button function"
	
	self assert: editor layerCount = 1.
	self assert: (editor selectedLayers includes: 1).
	self editor addLayer.
	self assert: editor layerCount = 2