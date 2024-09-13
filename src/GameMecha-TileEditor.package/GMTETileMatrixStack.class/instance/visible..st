accessing
visible: aBool

	self basicVisible: aBool.
		
	self doLayers: [:aLayer | 
		aLayer visible: aBool]