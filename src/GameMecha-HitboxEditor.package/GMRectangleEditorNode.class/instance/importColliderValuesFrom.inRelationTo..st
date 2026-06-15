import
importColliderValuesFrom: aGMCollider inRelationTo: aMorph

	self morph
		height: (self calculateImportHeights: aMorph From: aGMCollider);
		width: (self calculateImportWidth: aMorph From: aGMCollider);
		color: Color red.