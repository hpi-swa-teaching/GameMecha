import
importColliderValuesFrom: aGMCollider inRelationTo: aMorph

	self morph
		height: (self calculateImportHeights: aGMCollider);
		width: (self calculateImportWidth: aGMCollider)