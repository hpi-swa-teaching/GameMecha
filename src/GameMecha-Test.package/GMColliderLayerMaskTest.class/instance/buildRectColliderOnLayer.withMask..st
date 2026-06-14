running
buildRectColliderOnLayer: aLayerCollection withMask: aMaskCollection

	^ GMPrimitiveRectangleCollider new
		width: 50;
		height: 50;
		layers: aLayerCollection;
		mask: aMaskCollection;
		yourself