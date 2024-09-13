instance creation
width: aWidth height: aHeight layerIndex: anIndex

	^ (self rows: aHeight columns: aWidth)  
		layerIndex: anIndex;
		yourself