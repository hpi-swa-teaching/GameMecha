export
assignDefaultColliderValues: aGMCollider inRelationTo: aMorph

	aGMCollider
		parent: (self parent ifNotNil: [self parent collider]);
		center: 0 @ 0;
		scaleFactor: 1;
		rotation: 0.0