as yet unclassified
asignDefaultColliderValues: aGMCollider inRelationTo: aMorph

	aGMCollider
		parent: self parent;
		center: (self calcCenter: aMorph);
		scaleFactor: (self scaleFactor: aMorph);
		symbol: self symbol