updating
rescaleToWidth: aWidth height: aHeight
	"This will rescale layers be recreating them"

	| newLayers newLayer |
	self 
		width: aWidth;
		height: aHeight. 
	
	newLayers := OrderedCollection new.

	self doLayers: [:layer | 
		newLayer := layer asRescaledToWidth: aWidth height: aHeight.
		newLayers addLast: newLayer.
		layer free].
		
	self matrixLayers: newLayers