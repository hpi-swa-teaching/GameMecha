export
assignColliderValues: aCollider inRelationTo: aMorph

	aCollider
		width: (self calculateWidth: aMorph);
		height: (self calculateHeights: aMorph)