instance creation
fromWidth: aWidth height: aHeight morphicLayerOffset: anOffset

	^ (GMTETileMatrixStack new)
		width: aWidth;
		height: aHeight;
		morphicLayerStartingOffset: anOffset;
		pushLayer;
		yourself
		