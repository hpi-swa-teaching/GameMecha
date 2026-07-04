export
assignColliderValues: aCollider inRelationTo: aMorph

	aCollider
		radius: (self calculateRadius: aMorph);
		rotation: (self calculateRotation: aMorph)