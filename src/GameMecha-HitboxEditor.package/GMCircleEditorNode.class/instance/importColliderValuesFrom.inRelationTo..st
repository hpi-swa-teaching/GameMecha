import
importColliderValuesFrom: aGMCollider inRelationTo: aMorph

	| d |
	d := (self calculateImportRadius: aMorph From: aGMCollider) * 2.
	self morph
		extent: d @ d;
		color: (Color yellow alpha: 0.5)