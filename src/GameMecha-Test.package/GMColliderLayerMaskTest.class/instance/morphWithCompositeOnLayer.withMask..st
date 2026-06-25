running
morphWithCompositeOnLayer: aLayerCollection withMask: aMaskCollection

	^ GMCollisionTestMorph new
		collider: (self buildCompositeColliderOnLayer: aLayerCollection withMask: aMaskCollection);
		extent: 50 @ 50;
		position: 0 @ 0;
		yourself