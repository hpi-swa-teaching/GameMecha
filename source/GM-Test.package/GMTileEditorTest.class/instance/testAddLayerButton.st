layerTests
testAddLayerButton
	"tests the addLayer button function"
	
	self assert: editor getLayerList size = 1.
	self assert: editor selectedLayer = 1.
	self clickButton: (editor layerViewer submorphNamed: 'addLayer').
	self assert: editor getLayerList size = 2