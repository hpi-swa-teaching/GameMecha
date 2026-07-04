export
assignDefaultColliderValues: aGMCollider inRelationTo: aMorph

	aGMCollider
		parent: (self parent ifNotNil: [self parent collider]);
		center: (self calculateCenter: aMorph);
		scaleFactor: 1