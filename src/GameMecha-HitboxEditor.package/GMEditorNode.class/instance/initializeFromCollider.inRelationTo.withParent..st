import
initializeFromCollider: aGMCollider inRelationTo: aMorph withParent: aGMEditorNode

	self morph: self morphType new.
	self symbol: aGMCollider symbol.
	
	self importColliderValuesFrom: aGMCollider inRelationTo: aMorph.
	self morph center: (self calculateImportCenter: aMorph From: aGMCollider).
	self parent: aGMEditorNode.
	aMorph owner addMorph: self morph