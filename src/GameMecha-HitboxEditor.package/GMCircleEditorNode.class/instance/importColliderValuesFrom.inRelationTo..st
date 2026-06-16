import
importColliderValuesFrom: aGMCollider inRelationTo: aMorph

	| diameter |
	diameter := (self calculateImportRadius: aMorph From: aGMCollider) * 2.
	self morph
		extent: diameter px @ diameter px.