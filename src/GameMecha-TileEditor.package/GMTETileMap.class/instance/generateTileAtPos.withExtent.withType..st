initialization
generateTileAtPos: aPoint  withExtent: anExtent  withType: aTileClass

	^ (aTileClass
		position: aPoint
		extent: anExtent) 
		lock;
		beTransparent;
		yourself.