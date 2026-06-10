export
assignDefaultColliderValues: aGMCollider inRelationTo: aMorph

	aGMCollider
		parent: self parent;
		center: (self calculateCenter: aMorph);
		scaleFactor: (self scaleFactor: aMorph);
		symbol: self symbol;
		rotation: (self calculateRotation: aMorph)