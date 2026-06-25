running
buildCompositeColliderOnLayer: aLayerCollection withMask: aMaskCollection

	| composite childA childB |
	composite := GMCompositeCollider new
		layers: aLayerCollection;
		mask: aMaskCollection;
		yourself.
	childA := GMPrimitiveRectangleCollider new
		width: 50;
		height: 50;
		center: 0 @ 0;
		yourself.
	childB := GMPrimitiveRectangleCollider new
		width: 50;
		height: 50;
		center: 200 @ 0;
		yourself.
	composite addChild: childA.
	composite addChild: childB.
	^ composite