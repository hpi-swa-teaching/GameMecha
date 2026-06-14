accessing
morphOnLayer: aLayerCollection withMask: aMaskCollection

	^ GMCollisionTestMorph new
		collider: (self buildRectColliderOnLayer: aLayerCollection withMask: aMaskCollection);
		extent: 50 @ 50;
		position: 0 @ 0;
		yourself