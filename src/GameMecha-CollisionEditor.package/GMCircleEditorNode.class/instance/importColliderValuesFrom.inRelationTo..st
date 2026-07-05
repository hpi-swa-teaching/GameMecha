import
importColliderValuesFrom: aGMCollider inRelationTo: aMorph

	| diameter |
	diameter := aGMCollider radius * 2.
	self morph extent: diameter @ diameter