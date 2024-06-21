layerTests
testDeleteLayer
	
	self assert: editor getLayerList size = 1.
	self editor deleteLayer.
	self assert: editor getLayerList size = 1.
	self editor addLayer.
	self assert: editor getLayerList size = 2.
	self editor deleteLayer.
	self assert: editor getLayerList size = 1
	