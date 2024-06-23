layerTests
testAddLayerButton
	"tests the addLayer button function"
	
	self assert: editor layerData size = 1.
	self assert: (editor selectedLayers includes: 1).
	self clickButton: (editor layerViewer submorphNamed: 'addLayer').
	self assert: editor layerData size = 2