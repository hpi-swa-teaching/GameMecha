layerTests
testMultiDeleteLayer
	
	self assert: editor getLayerList size = 1.
	self editor deleteSelectedLayers.
	self assert: editor getLayerList size = 1.
	self editor addLayer.
	self editor addLayer.
	self assert: editor getLayerList size = 3.
	self editor selectLayer: 2.
	self editor deleteSelectedLayers.
	self assert: editor getLayerList size = 1.
	