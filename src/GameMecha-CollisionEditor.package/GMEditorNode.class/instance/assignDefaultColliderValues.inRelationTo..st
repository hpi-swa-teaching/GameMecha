export
assignDefaultColliderValues: aGMCollider inRelationTo: aMorph

	aGMCollider
		parent: (self parent ifNotNil: [self parent collider]);
		center: (self calculateExportCenter: aMorph);
		scaleFactor: 1