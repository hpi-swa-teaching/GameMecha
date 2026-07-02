import
importColliderValuesFrom: aGMCollider inRelationTo: aMorph

	self morph
		height: (self calculateImportHeights: aGMCollider) px;
		width: (self calculateImportWidth: aGMCollider) px