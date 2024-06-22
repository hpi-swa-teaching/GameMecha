layerTests
testDeleteLayer
	"tests the deletion of a single selected layer"
	
	self assert: editor getLayerList size = 1.
	self editor deleteSelectedLayers.
	self assert: editor getLayerList size = 1.
	self editor addLayer.
	self assert: editor getLayerList size = 2.
	self editor deleteSelectedLayers.
	self assert: editor getLayerList size = 1