import
importColliderValuesFrom: aGMCollider inRelationTo: aMorph

	self morph
		height: (self calculateImportHeights: aMorph From: aGMCollider) px;
		width: (self calculateImportWidth: aMorph From: aGMCollider) px